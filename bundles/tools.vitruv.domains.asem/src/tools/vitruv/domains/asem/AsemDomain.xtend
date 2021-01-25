package tools.vitruv.domains.asem

import tools.vitruv.framework.tuid.AttributeTuidCalculatorAndResolver
import tools.vitruv.framework.tuid.TuidCalculatorAndResolver
import tools.vitruv.framework.domains.AbstractTuidAwareVitruvDomain
import edu.kit.ipd.sdq.metamodels.asem.base.BasePackage
import edu.kit.ipd.sdq.metamodels.asem.AsemPackage

class AsemDomain extends AbstractTuidAwareVitruvDomain {
	public static val METAMODEL_NAME = "ASEM"
	public static val FILE_EXTENSION = "asem"
	public static val ROOT_PACKAGE = AsemPackage.eINSTANCE

	package new() {
		super(METAMODEL_NAME, ROOT_PACKAGE, generateTuidCalculator(), FILE_EXTENSION)
	}

	def protected static TuidCalculatorAndResolver generateTuidCalculator() {
		return new AttributeTuidCalculatorAndResolver(
			ROOT_PACKAGE.nsURI,
			#[BasePackage.Literals.IDENTIFIABLE__ID.name, BasePackage.Literals.NAMED__NAME.name]
		)
	}

}
