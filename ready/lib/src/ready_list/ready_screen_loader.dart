part of ready_list;

class ReadyScreenLoader extends StatelessWidget {
  final bool loading;
  final String? error;
  final VoidCallback? onReload;
  final PlaceholdersConfig? config;
  const ReadyScreenLoader({
    Key? key,
    required this.error,
    required this.loading,
    this.onReload,
    this.config,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var conf = _ReadyListConfigOptionsDefaults.effective(null, context)
        .placeholdersConfig
        .copyWith(config);
    if (conf.builder != null) return conf.builder!(loading, error);
    var tr = Ready.localization(context);
    String message;
    bool hasError = error != null;
    if (loading == true) {
      message = conf.loadingText ?? tr.loading;
    } else {
      message = error ?? conf.emptyText ?? tr.emptyList;
    }
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: ClipRRect(
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  key: Key('$loading$hasError'),
                  child: _getPlaceHolder(context, loading, conf),
                ),
              ),
              SizedBox(height: conf.spaceBetweenIconAndText),
              Text(message),
              SizedBox(height: conf.spaceBetweenTextAndButton),
              if (onReload != null && !loading)
                _getTextButton(context, loading, onReload!, conf),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _getTextButton(BuildContext context, bool loading,
      VoidCallback action, PlaceholdersConfig config) {
    var tr = Ready.localization(context);

    return TextButton(
      onPressed: loading ? null : action,
      child: Text(config.reload ?? tr.reload, textAlign: TextAlign.center),
    );
  }

  Widget _getPlaceHolder(
      BuildContext context, bool loading, PlaceholdersConfig config) {
    if (loading == true) {
      return _getLoader(context, config);
    } else {
      return IconTheme.merge(
        data: const IconThemeData(size: 100),
        child: config.icon ?? const Icon(Icons.travel_explore_rounded),
      );
    }
  }

  Widget _getLoader(BuildContext context, PlaceholdersConfig config) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: config.loadingIndicator ?? const CircularProgressIndicator(),
    );
  }
}
