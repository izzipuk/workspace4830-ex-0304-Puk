
public aspect TraceAspectPuk {
	
	pointcut ClassToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut methodToTrace(): execution(String getName());
	
	before(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSignature() + ", "
					+ thisJoinPointStaticPart.getSourceLocation().getLine() + ", ";
		System.out.println("\t-->" + info);
				
	}
	
	after(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("\t<--" + info);
	}

}
