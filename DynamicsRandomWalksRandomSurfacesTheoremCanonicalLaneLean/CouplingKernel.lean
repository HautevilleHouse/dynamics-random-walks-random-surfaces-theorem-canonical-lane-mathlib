import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure CouplingKernel (R : RandomWalkModel) (S : RandomSurfaceModel) where
  stateProduct : Type u
  kernel : stateProduct → stateProduct → Prop
  marginalConsistency : Prop
  markovProperty : Prop
  invariantMeasure : stateProduct → Prop

structure CouplingKernelEvidence (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) where
  marginalConsistencyClosed : K.marginalConsistency
  markovPropertyClosed : K.markovProperty
  invariantMeasureClosed : ∃ μ : (K.stateProduct → Prop), ∀ x : K.stateProduct, μ x ∨ ¬ μ x

def CouplingKernelClosed (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) : Prop :=
  K.marginalConsistency ∧ K.markovProperty ∧ (∃ μ : (K.stateProduct → Prop), ∀ x : K.stateProduct, μ x ∨ ¬ μ x)

theorem coupling_kernel_closed_from_evidence (R : RandomWalkModel) (S : RandomSurfaceModel) (K : CouplingKernel R S) (E : CouplingKernelEvidence R S K) : CouplingKernelClosed R S K := by
  exact And.intro E.marginalConsistencyClosed (And.intro E.markovPropertyClosed E.invariantMeasureClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse