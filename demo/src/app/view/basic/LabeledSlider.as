package app.view.basic
{
    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Slider;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;

    import starling.events.Event;

    public class LabeledSlider extends LayoutGroup
    {
        public const slider:Slider = new Slider();
        public const title:Label = new Label();

        private const _valueLabel:Label = new Label();

        public function LabeledSlider()
        {
        }

        public override function dispose():void
        {
            if (isInitialized)
            {
                slider.removeEventListener(Event.CHANGE, slider_changeHandler);
            }
            super.dispose();
        }

        protected override function initialize():void
        {
            super.initialize();

            layout = new AnchorLayout();

            var ald:AnchorLayoutData;

            ald = new AnchorLayoutData();
            ald.verticalCenter = 0;
            ald.horizontalCenter = 0;
            slider.layoutData = ald;
            slider.addEventListener(Event.CHANGE, slider_changeHandler);
            addChild(slider);

            ald = new AnchorLayoutData();
            ald.verticalCenter = 0;
            ald.left = 5;
            title.layoutData = ald;
            title.touchable = false;
            addChild(title);

            ald = new AnchorLayoutData();
            ald.verticalCenter = 0;
            ald.right = 5;
            _valueLabel.layoutData = ald;
            _valueLabel.touchable = false;
            addChild(_valueLabel);
        }

        private function slider_changeHandler(event:Event):void
        {
            _valueLabel.text = slider.value.toFixed(2);
        }
    }
}