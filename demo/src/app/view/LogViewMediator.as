package app.view
{
    import app.model.GUIModel;
    import app.rccontext.CustomRCContext;
    import app.rccontext.CustomRCContextEvent;

    import recastnavigation.recast.enum.RCLogCategory;

    public class LogViewMediator
    {
        private var _logView:LogView;
        private var _context:CustomRCContext;
        private var _guiModel:GUIModel;

        public function LogViewMediator()
        {
        }

        public function connect(logView:LogView, guiModel:GUIModel, context:CustomRCContext):void
        {
            _logView = logView;
            _guiModel = guiModel;
            _context = context;
            _context.addEventListener(CustomRCContextEvent.MESSAGE, onContextMessage);
            _context.addEventListener(CustomRCContextEvent.RESET, onContextReset);
        }

        private function onContextMessage(event:CustomRCContextEvent):void
        {
            _logView.scrollText.text += event.message + "\n";
            if (event.logCategory == RCLogCategory.RC_LOG_ERROR)
                _guiModel.showLog = true;
        }

        private function onContextReset(event:CustomRCContextEvent):void
        {
            _logView.scrollText.text = "";
        }
    }
}