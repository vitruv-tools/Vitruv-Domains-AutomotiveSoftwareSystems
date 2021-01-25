package tools.vitruv.domains.amalthea

import tools.vitruv.framework.tuid.AttributeTuidCalculatorAndResolver
import tools.vitruv.framework.tuid.TuidCalculatorAndResolver
import org.eclipse.app4mc.amalthea.model.AmaltheaPackage
import tools.vitruv.framework.domains.AbstractTuidAwareVitruvDomain

class AmaltheaDomain extends AbstractTuidAwareVitruvDomain {
	public static val METAMODEL_NAME = "Amalthea"
	public static val FILE_EXTENSION = "amalthea"
	public static val ROOT_PACKAGE = AmaltheaPackage.eINSTANCE

	package new() {
		super(METAMODEL_NAME, ROOT_PACKAGE, generateTuidCalculator(), FILE_EXTENSION)
	}

	def protected static TuidCalculatorAndResolver generateTuidCalculator() {
		return new AttributeTuidCalculatorAndResolver(
			ROOT_PACKAGE.nsURI,
			#[AmaltheaPackage.eINSTANCE.INamed_Name.name]
		)
	}

}
