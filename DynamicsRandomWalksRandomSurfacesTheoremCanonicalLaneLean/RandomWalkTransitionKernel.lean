import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomWalkTransitionKernelPackage where
  stateSpace : Type u
  kernel : stateSpace → Set (stateSpace → ℝ)
  markovProperty : Prop
  translationInvariant : Prop
  finiteSecondMoment : Prop

structure RandomWalkTransitionKernelEvidence (K : RandomWalkTransitionKernelPackage) where
  markovPropertyClosed : K.markovProperty
  translationInvariantClosed : K.translationInvariant
  finiteSecondMomentClosed : K.finiteSecondMoment

def RandomWalkTransitionKernelClosed (K : RandomWalkTransitionKernelPackage) : Prop :=
  K.markovProperty ∧ K.translationInvariant ∧ K.finiteSecondMoment

theorem random_walk_transition_kernel_closed_from_evidence
    (K : RandomWalkTransitionKernelPackage)
    (E : RandomWalkTransitionKernelEvidence K) : RandomWalkTransitionKernelClosed K := by
  exact And.intro E.markovPropertyClosed
    (And.intro E.translationInvariantClosed E.finiteSecondMomentClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
