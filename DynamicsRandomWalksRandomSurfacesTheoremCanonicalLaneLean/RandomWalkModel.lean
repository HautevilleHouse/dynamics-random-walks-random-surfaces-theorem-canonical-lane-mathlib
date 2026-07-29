import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure RandomWalkModel where
  stateSpace : Type u
  transitionKernel : stateSpace → stateSpace → Prop
  initialDistribution : stateSpace → Prop
  timeHomogeneous : Prop
  irreducible : Prop
  stationaryMeasure : stateSpace → Prop

structure RandomWalkEvidence (M : RandomWalkModel) where
  transitionKernelClosed : ∀ x y : M.stateSpace, M.transitionKernel x y ∨ ¬ M.transitionKernel x y
  initialDistributionClosed : ∃ x : M.stateSpace, M.initialDistribution x
  timeHomogeneousClosed : M.timeHomogeneous
  irreducibleClosed : M.irreducible
  stationaryMeasureClosed : ∃ μ : (M.stateSpace → Prop), ∀ x : M.stateSpace, μ x ∨ ¬ μ x

def RandomWalkModelClosed (M : RandomWalkModel) : Prop :=
  (∀ x y : M.stateSpace, M.transitionKernel x y ∨ ¬ M.transitionKernel x y) ∧
  (∃ x : M.stateSpace, M.initialDistribution x) ∧
  M.timeHomogeneous ∧
  M.irreducible ∧
  (∃ μ : (M.stateSpace → Prop), ∀ x : M.stateSpace, μ x ∨ ¬ μ x)

theorem random_walk_model_closed_from_evidence (M : RandomWalkModel) (E : RandomWalkEvidence M) : RandomWalkModelClosed M := by
  exact And.intro E.transitionKernelClosed (And.intro E.initialDistributionClosed (And.intro E.timeHomogeneousClosed (And.intro E.irreducibleClosed E.stationaryMeasureClosed)))

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse