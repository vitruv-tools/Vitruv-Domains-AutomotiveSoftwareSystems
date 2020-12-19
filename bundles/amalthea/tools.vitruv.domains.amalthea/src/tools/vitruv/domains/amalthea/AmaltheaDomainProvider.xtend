package tools.vitruv.domains.amalthea

import tools.vitruv.framework.domains.VitruvDomainProvider

class AmaltheaDomainProvider implements VitruvDomainProvider<AmaltheaDomain> {
	static var AmaltheaDomain instance;
	
	override AmaltheaDomain getDomain() {
		if (instance === null) {
			instance = new AmaltheaDomain();
		}
		return instance;
	}
}