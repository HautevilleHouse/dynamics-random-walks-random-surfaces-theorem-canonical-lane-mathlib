import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomWalkKernelPackage where
  stateSpace : Type u
  transitionProbability : stateSpace → stateSpace → Prop
  markovProperty : Prop
  stationarity : Prop
  kernelRegularity : Prop

structure RandomWalkKernelEvidence (K : RandomWalkKernelPackage) where
  markovPropertyClosed : K.markovProperty
  stationarityClosed : K.stationarity
  kernelRegularityClosed : K.kernelRegularity

def RandomWalkKernelClosed (K : RandomWalkKernelPackage) : Prop :=
  K.markovProperty ∧ K.stationarity ∧ K.kernelRegularity

theorem random_walk_kernel_closed_from_evidence (K : RandomWalkKernelPackage)
    (E : RandomWalkKernelEvidence K) : RandomWalkKernelClosed K := by
  exact And.intro E.markovPropertyClosed (And.intro E.stationarityClosed E.kernelRegularityClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse