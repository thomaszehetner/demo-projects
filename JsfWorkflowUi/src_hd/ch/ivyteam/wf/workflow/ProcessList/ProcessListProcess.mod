[Ivy]
[>Created: Mon Aug 19 11:27:36 CEST 2013]
13ED18A804435D54 3.17 #module
>Proto >Proto Collection #zClass
Ps0 ProcessListProcess Big #zClass
Ps0 RD #cInfo
Ps0 #process
Ps0 @TextInP .ui2RdDataAction .ui2RdDataAction #zField
Ps0 @TextInP .rdData2UIAction .rdData2UIAction #zField
Ps0 @TextInP .resExport .resExport #zField
Ps0 @TextInP .type .type #zField
Ps0 @TextInP .processKind .processKind #zField
Ps0 @AnnotationInP-0n ai ai #zField
Ps0 @TextInP .xml .xml #zField
Ps0 @TextInP .responsibility .responsibility #zField
Ps0 @RichDialogInitStart f0 '' #zField
Ps0 @RichDialogProcessEnd f1 '' #zField
Ps0 @GridStep f3 '' #zField
Ps0 @PushWFArc f4 '' #zField
Ps0 @PushWFArc f2 '' #zField
>Proto Ps0 Ps0 ProcessListProcess #zField
Ps0 f0 guid 13ED18A805A7471B #txt
Ps0 f0 type ch.ivyteam.wf.workflow.ProcessList.ProcessListData #txt
Ps0 f0 method start() #txt
Ps0 f0 disableUIEvents true #txt
Ps0 f0 inParameterDecl 'ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent methodEvent = event as ch.ivyteam.ivy.richdialog.exec.RdMethodCallEvent;
<> param = methodEvent.getInputArguments();
' #txt
Ps0 f0 outParameterDecl '<> result;
' #txt
Ps0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ps0 f0 86 54 20 20 13 0 #rect
Ps0 f0 @|RichDialogInitStartIcon #fIcon
Ps0 f1 type ch.ivyteam.wf.workflow.ProcessList.ProcessListData #txt
Ps0 f1 86 182 20 20 13 0 #rect
Ps0 f1 @|RichDialogProcessEndIcon #fIcon
Ps0 f3 actionDecl 'ch.ivyteam.wf.workflow.ProcessList.ProcessListData out;
' #txt
Ps0 f3 actionTable 'out=in;
' #txt
Ps0 f3 actionCode 'import ch.ivyteam.ivy.workflow.IProcessStart;

for(IProcessStart processStart : ivy.session.getStartableProcessStarts())
{
	if(processStart.getName() != "Workflow Home")
	{
		out.starts.add(processStart);
	}
}

' #txt
Ps0 f3 type ch.ivyteam.wf.workflow.ProcessList.ProcessListData #txt
Ps0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>collect processstarts</name>
        <nameStyle>21
</nameStyle>
    </language>
</elementInfo>
' #txt
Ps0 f3 78 116 36 24 20 -2 #rect
Ps0 f3 @|StepIcon #fIcon
Ps0 f4 expr out #txt
Ps0 f4 96 74 96 116 #arcP
Ps0 f2 expr out #txt
Ps0 f2 96 140 96 182 #arcP
>Proto Ps0 .type ch.ivyteam.wf.workflow.ProcessList.ProcessListData #txt
>Proto Ps0 .processKind HTML_DIALOG #txt
>Proto Ps0 -8 -8 16 16 16 26 #rect
>Proto Ps0 '' #fIcon
Ps0 f0 mainOut f4 tail #connect
Ps0 f4 head f3 mainIn #connect
Ps0 f3 mainOut f2 tail #connect
Ps0 f2 head f1 mainIn #connect
