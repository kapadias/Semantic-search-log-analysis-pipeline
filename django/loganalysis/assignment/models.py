from django.db import models

class Assignment(models.Model):
    """ORM class for assignment table"""
    adjustedQueryCase = models.CharField(max_length=200, null=True, blank=True)
    NewSemanticTypeName = models.CharField(max_length=100, null=True, blank=True)
    preferredTerm = models.CharField(max_length=200, null=True, blank=True)
    FuzzyToken = models.CharField(max_length=50, null=True, blank=True)
    SemanticTypeName = models.CharField(max_length=100, null=True, blank=True)
    SemanticGroup = models.CharField(max_length=50, null=True, blank=True)
    timesSearched = models.IntegerField(null=True)
    FuzzyScore = models.IntegerField(null=True)
    Modified = models.IntegerField(null=True)

    class Meta:
        db_table = 'manual_assignments'

    def take_action(self, action):
        """Update database entry with new user supplied semantic type name"""
        user_to_db = {'NLM Product/Service':'NLM Product or Service',
                        'Human':'Human',
                        'Journal Name':'Journal-related',
                        'Add to RegEx':'Add Regex',
                        'Combo':'Combo'}
        if action in ['NLM Product/Service',
                            'Human', 
                            'Journal Name', 
                            'Add to RegEx', 
                            'Combo']:
            self.NewSemanticTypeName = user_to_db[action]
            self.preferredTerm = None
        elif action == 'Ignore':
            self.NewSemanticTypeName = 'Ignore'
        elif action == 'Accept':
            self.NewSemanticTypeName = self.SemanticTypeName
        elif action == 'Foreign':
            self.preferredTerm = 'Foreign language'
            self.NewSemanticTypeName = 'Foreign language'
            self.SemanticGroup = 'Foreign language'
        else:
            raise Exception("New type not recognized")
        self.save()

    def take_vetting_action(self, action):
        """Update fuzzy match details with user input"""        
        if action == 'Okay':
            self.Modified = 0
        elif action == 'Drop Row':
            self.delete()
            return
        elif action == 'Drop Preferred':
            self.Modified = 1
            self.preferredTerm = None
        else:
            raise Exception("New type not recognized")
        self.save()




def summarize():
    """Fetch counts of semantic type name"""
    results = Assignment.objects.values('NewSemanticTypeName'). \
                annotate(num_type_name = models.Count('id')). \
                order_by('-num_type_name').all()
    return results


def get_fuzzy_matches(limit=50):
    """Fetch matches needing user review"""
    results = Assignment.objects.filter(NewSemanticTypeName=None). \
                order_by('-timesSearched').all()[:limit]
    return results


def create_form_from_object(obj, form):
    """Generate a form attached to a database row"""
    return form({'query_id':obj.id})


def get_vetter_matches(limit=50):
    """Fetch fuzzy matches for user review"""
    results = Assignment.objects.filter(Modified=None). \
                exclude(NewSemanticTypeName='Combo'). \
                order_by('preferredTerm').all()[:limit]
    return results

