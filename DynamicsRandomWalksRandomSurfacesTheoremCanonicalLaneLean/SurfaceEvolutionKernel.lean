import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure SurfaceEvolutionKernel where
  stepDistribution : Type u
  transitionProbability : Type v
  heatKernelRegularity : Prop
  invariantMeasure : Prop
  spectralGap : Prop

structure SurfaceEvolutionKernelEvidence (K : SurfaceEvolutionKernel) where
  heatKernelRegularityClosed : K.heatKernelRegularity
  invariantMeasureClosed : K.invariantMeasure
  spectralGapClosed : K.spectralGap

def SurfaceEvolutionKernelClosed (K : SurfaceEvolutionKernel) : Prop :=
  K.heatKernelRegularity ∧ K.invariantMeasure ∧ K.spectralGap

theorem surface_evolution_kernel_closed_from_evidence (K : SurfaceEvolutionKernel)
    (E : SurfaceEvolutionKernelEvidence K) : SurfaceEvolutionKernelClosed K := by
  exact And.intro E.heatKernelRegularityClosed
    (And.intro E.invariantMeasureClosed E.spectralGapClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse