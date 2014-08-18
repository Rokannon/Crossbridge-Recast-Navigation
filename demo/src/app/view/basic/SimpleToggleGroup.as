package app.view.basic
{
    import app.view.GUIView;

    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Radio;
    import feathers.core.ToggleGroup;
    import feathers.layout.VerticalLayout;

    public class SimpleToggleGroup extends LayoutGroup
    {
        public const toggleGroup:ToggleGroup = new ToggleGroup();

        private var _radioNames:Vector.<String>;
        private var _title:String;

        public function SimpleToggleGroup(radioNames:Vector.<String>, title:String = null)
        {
            super();
            _radioNames = radioNames;
            _title = title;
        }

        protected override function initialize():void
        {
            super.initialize();

            var vl:VerticalLayout = new VerticalLayout();
            vl.gap = GUIView.TOGGLE_GROUP_GAP;
            layout = vl;

            if (_title != null)
            {
                var label:Label = new Label();
                label.text = _title;
                addChild(label);
            }

            for (var i:int = 0; i < _radioNames.length; ++i)
            {
                var radio:Radio;
                radio = new Radio();
                radio.label = _radioNames[i];
                toggleGroup.addItem(radio);
                addChild(radio);
            }
        }
    }
}