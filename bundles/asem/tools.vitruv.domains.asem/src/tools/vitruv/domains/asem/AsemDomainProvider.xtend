package tools.vitruv.domains.asem

import tools.vitruv.framework.domains.VitruvDomainProvider

class AsemDomainProvider implements VitruvDomainProvider<AsemDomain> {
	static var AsemDomain instance;
	
	override AsemDomain getDomain() {
		if (instance === null) {
			instance = new AsemDomain();
		}
		return instance;
	}
}