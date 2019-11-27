package tools.vitruv.domains.asem

import tools.vitruv.framework.tuid.AttributeTuidCalculatorAndResolver
import tools.vitruv.framework.tuid.TuidCalculatorAndResolver
import static tools.vitruv.domains.asem.AsemNamespace.*;
import tools.vitruv.domains.emf.builder.VitruviusEmfBuilderApplicator
import tools.vitruv.framework.domains.AbstractTuidAwareVitruvDomain
import edu.kit.ipd.sdq.metamodels.asem.base.BasePackage

class AsemDomain extends AbstractTuidAwareVitruvDomain {
	public static final String METAMODEL_NAME = "asem"
	
	package new() {
		super(METAMODEL_NAME, ROOT_PACKAGE, generateTuidCalculator(), FILE_EXTENSION);
	}

	def protected static TuidCalculatorAndResolver generateTuidCalculator() {
		return new AttributeTuidCalculatorAndResolver(METAMODEL_NAMESPACE, 
			#[BasePackage.Literals.IDENTIFIABLE__ID.name, BasePackage.Literals.NAMED__NAME.name]
		);
	}
	
	
	override getBuilderApplicator() {
		return new VitruviusEmfBuilderApplicator();
	}
	
}