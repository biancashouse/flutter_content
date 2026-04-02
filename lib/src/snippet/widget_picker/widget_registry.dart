import 'package:flutter_content/flutter_content.dart';
import 'widget_entry.dart';

const List<WidgetEntry> widgetRegistry = [
  // layout
  WidgetEntry(label: 'Align', type: AlignNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'Aspect Ratio', type: AspectRatioNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'Center', type: CenterNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'ConstrainedBox', type: ConstrainedBoxNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'Container', type: ContainerNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'DefaultTextStyle', type: DefaultTextStyleNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'Padding', type: PaddingNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'Scaffold', type: ScaffoldNode, category: WidgetCategory.layout),
  WidgetEntry(label: 'SizedBox', type: SizedBoxNode, category: WidgetCategory.layout),
  // flex
  WidgetEntry(label: 'Column', type: ColumnNode, category: WidgetCategory.flex),
  WidgetEntry(label: 'Expanded', type: ExpandedNode, category: WidgetCategory.flex),
  WidgetEntry(label: 'Flexible', type: FlexibleNode, category: WidgetCategory.flex),
  WidgetEntry(label: 'IntrinsicHeight', type: IntrinsicHeightNode, category: WidgetCategory.flex),
  WidgetEntry(label: 'IntrinsicWidth', type: IntrinsicWidthNode, category: WidgetCategory.flex),
  WidgetEntry(label: 'Row', type: RowNode, category: WidgetCategory.flex),
  WidgetEntry(label: 'Wrap', type: WrapNode, category: WidgetCategory.flex),
  // scroll
  WidgetEntry(label: 'GridView', type: GridViewNode, category: WidgetCategory.scroll),
  WidgetEntry(label: 'InteractiveViewer', type: InteractiveViewerNode, category: WidgetCategory.scroll),
  WidgetEntry(label: 'ListView', type: ListViewNode, category: WidgetCategory.scroll),
  WidgetEntry(label: 'PageView', type: PageViewNode, category: WidgetCategory.scroll),
  WidgetEntry(label: 'SingleChildScrollView', type: SingleChildScrollViewNode, category: WidgetCategory.scroll),
  // stack
  WidgetEntry(label: 'Positioned', type: PositionedNode, category: WidgetCategory.stack),
  WidgetEntry(label: 'SplitView', type: SplitViewNode, category: WidgetCategory.stack),
  WidgetEntry(label: 'Stack', type: StackNode, category: WidgetCategory.stack),
  // slivers
  WidgetEntry(label: 'CustomScrollView', type: CustomScrollViewNode, category: WidgetCategory.sliver),
  WidgetEntry(label: 'PinnedHeaderSliver', type: PinnedHeaderSliverNode, category: WidgetCategory.sliver),
  WidgetEntry(label: 'SliverAppBar', type: SliverAppBarNode, category: WidgetCategory.sliver),
  WidgetEntry(label: 'SliverFloatingHeader', type: SliverFloatingHeaderNode, category: WidgetCategory.sliver),
  WidgetEntry(label: 'SliverList.list', type: SliverListListNode, category: WidgetCategory.sliver),
  WidgetEntry(label: 'SliverResizingHeader', type: SliverResizingHeaderNode, category: WidgetCategory.sliver),
  WidgetEntry(label: 'SliverToBoxAdapter', type: SliverToBoxAdapterNode, category: WidgetCategory.sliver),
  // text
  WidgetEntry(label: 'Markdown', type: MarkdownNode, category: WidgetCategory.text),
  WidgetEntry(label: 'QuillText', type: QuillTextNode, category: WidgetCategory.text, keywords: ['rich', 'quill']),
  WidgetEntry(label: 'RichText', type: RichTextNode, category: WidgetCategory.text),
  WidgetEntry(label: 'Text', type: TextNode, category: WidgetCategory.text),
  WidgetEntry(label: 'TextSpan', type: TextSpanNode, category: WidgetCategory.text),
  WidgetEntry(label: 'WidgetSpan', type: WidgetSpanNode, category: WidgetCategory.text),
  // button
  WidgetEntry(label: 'ElevatedButton', type: ElevatedButtonNode, category: WidgetCategory.button),
  WidgetEntry(label: 'FilledButton', type: FilledButtonNode, category: WidgetCategory.button),
  WidgetEntry(label: 'IconButton', type: IconButtonNode, category: WidgetCategory.button),
  WidgetEntry(label: 'OutlinedButton', type: OutlinedButtonNode, category: WidgetCategory.button),
  WidgetEntry(label: 'TextButton', type: TextButtonNode, category: WidgetCategory.button),
  // navigation
  WidgetEntry(label: 'Chip', type: ChipNode, category: WidgetCategory.navigation),
  WidgetEntry(label: 'MenuBar', type: MenuBarNode, category: WidgetCategory.navigation),
  WidgetEntry(label: 'MenuItemButton', type: MenuItemButtonNode, category: WidgetCategory.navigation),
  WidgetEntry(label: 'SubmenuButton', type: SubmenuButtonNode, category: WidgetCategory.navigation),
  WidgetEntry(label: 'Tab', type: TabNode, category: WidgetCategory.navigation),
  WidgetEntry(label: 'TabBar', type: TabBarNode, category: WidgetCategory.navigation),
  WidgetEntry(label: 'TabBarView', type: TabBarViewNode, category: WidgetCategory.navigation),
  // image
  WidgetEntry(label: 'Algorithm', type: AlgCNode, category: WidgetCategory.image, keywords: ['algc', 'diagram']),
  WidgetEntry(label: 'Asset Image', type: AssetImageNode, category: WidgetCategory.image, keywords: ['image', 'asset', 'local']),
  WidgetEntry(label: 'Carousel', type: CarouselNode, category: WidgetCategory.image, keywords: ['slider', 'gallery']),
  WidgetEntry(label: 'Firebase Storage Image', type: StorageImageNode, category: WidgetCategory.image, keywords: ['firebase', 'image', 'storage', 'cloud']),
  WidgetEntry(label: 'UML', type: UMLImageNode, category: WidgetCategory.image, keywords: ['diagram', 'class']),
  // media
  WidgetEntry(label: 'Directory', type: DirectoryNode, category: WidgetCategory.media, keywords: ['folder', 'files']),
  WidgetEntry(label: 'File', type: FileNode, category: WidgetCategory.media),
  WidgetEntry(label: 'Google Drive iframe', type: GoogleDriveIFrameNode, category: WidgetCategory.media, keywords: ['google', 'drive', 'embed', 'gdoc']),
  WidgetEntry(label: 'iframe', type: IFrameNode, category: WidgetCategory.media, keywords: ['embed', 'web', 'html']),
  WidgetEntry(label: 'Youtube', type: YTNode, category: WidgetCategory.media, keywords: ['video', 'youtube', 'yt']),
  // content
  WidgetEntry(label: 'Gap', type: GapNode, category: WidgetCategory.content, keywords: ['space', 'spacer']),
  WidgetEntry(label: 'Hotspots', type: TargetsWrapperNode, category: WidgetCategory.content, keywords: ['target', 'callout', 'annotation']),
  WidgetEntry(label: 'Placeholder', type: PlaceholderNode, category: WidgetCategory.content),
  WidgetEntry(label: 'Poll', type: PollNode, category: WidgetCategory.content),
  WidgetEntry(label: 'PollOption', type: PollOptionNode, category: WidgetCategory.content),
  WidgetEntry(label: 'Step', type: StepNode, category: WidgetCategory.content),
  WidgetEntry(label: 'Stepper', type: StepperNode, category: WidgetCategory.content),
];
