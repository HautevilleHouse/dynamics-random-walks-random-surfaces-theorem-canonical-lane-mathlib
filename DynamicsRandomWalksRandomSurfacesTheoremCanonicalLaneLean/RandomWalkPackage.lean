import DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomWalkPackage where
  stateSpace : Type u
  initialState : stateSpace
  transitionKernel : stateSpace → stateSpace → Prop
  markovProperty : Prop
  timeHomogeneous : Prop
  irreducible : Prop
  stationaryDistribution : stateSpace → Prop
  markovPropertyTerm : markovProperty
  timeHomogeneousTerm : timeHomogeneous
  irreducibleTerm : irreducible
  stationaryDistributionTerm : ∃ (π : stateSpace → Prop), ∀ x : stateSpace, π x

def RandomWalkClosed (R : RandomWalkPackage) : Prop :=
  R.markovProperty ∧ R.timeHomogeneous ∧ R.irreducible ∧ R.stationaryDistributionTerm

theorem random_walk_closed_from_evidence (R : RandomWalkPackage) : RandomWalkClosed R := by
  exact And.intro R.markovPropertyTerm
    (And.intro R.timeHomogeneousTerm
      (And.intro R.irreducibleTerm R.stationaryDistributionTerm))

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse
