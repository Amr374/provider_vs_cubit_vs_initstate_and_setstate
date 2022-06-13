abstract class ArticlesStates {}
class GetArticlesInitialState extends ArticlesStates {}

class GetArticlesLoadingState extends ArticlesStates {}

class GetArticlesSuccessState extends ArticlesStates {}

class GetArticlesErrorState extends ArticlesStates
{
  final String error;

  GetArticlesErrorState(this.error);
}
