import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomWalkTransitionPackage where
  stateSpace : Type u
  stepDistribution : stateSpace → stateSpace → Prop
  transitionKernel : stateSpace → stateSpace → ℝ
  markovProperty : Prop
  timeHomogeneous : Prop
  stationaryDistribution : stateSpace → ℝ
  detailedBalance : Prop

structure RandomWalkTransitionEvidence (R : RandomWalkTransitionPackage) where
  markovPropertyClosed : R.markovProperty
  timeHomogeneousClosed : R.timeHomogeneous
  stationaryDistributionClosed : ∃ μ : R.stateSpace → ℝ, (∀ x : R.stateSpace, μ x ≥ 0) ∧ (∑' x : R.stateSpace, μ x = 1) ∧ (∀ y : R.stateSpace, (∑' x : R.stateSpace, μ x * R.transitionKernel x y) = μ y)
  detailedBalanceClosed : R.detailedBalance

def RandomWalkTransitionClosed (R : RandomWalkTransitionPackage) : Prop :=
  R.markovProperty ∧ R.timeHomogeneous ∧
  (∃ μ : R.stateSpace → ℝ, (∀ x : R.stateSpace, μ x ≥ 0) ∧ (∑' x : R.stateSpace, μ x = 1) ∧ (∀ y : R.stateSpace, (∑' x : R.stateSpace, μ x * R.transitionKernel x y) = μ y)) ∧
  R.detailedBalance

theorem random_walk_transition_closed_from_evidence (R : RandomWalkTransitionPackage) (E : RandomWalkTransitionEvidence R) : RandomWalkTransitionClosed R := by
  exact And.intro E.markovPropertyClosed (And.intro E.timeHomogeneousClosed (And.intro E.stationaryDistributionClosed E.detailedBalanceClosed))

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse