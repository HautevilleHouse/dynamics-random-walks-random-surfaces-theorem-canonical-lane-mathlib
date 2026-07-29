import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure GaussianFreeFieldRoughness where
  fieldCovariance : Type u
  logCorrelated : Prop
  multifractalSpectrum : Prop
  extremalProcessDistribution : Prop

structure GaussianFreeFieldRoughnessEvidence (G : GaussianFreeFieldRoughness) where
  logCorrelatedClosed : G.logCorrelated
  multifractalSpectrumClosed : G.multifractalSpectrum
  extremalProcessDistributionClosed : G.extremalProcessDistribution

def GaussianFreeFieldRoughnessClosed (G : GaussianFreeFieldRoughness) : Prop :=
  G.logCorrelated ∧ G.multifractalSpectrum ∧ G.extremalProcessDistribution

theorem gaussian_free_field_roughness_closed_from_evidence
    (G : GaussianFreeFieldRoughness) (E : GaussianFreeFieldRoughnessEvidence G) :
    GaussianFreeFieldRoughnessClosed G := by
  exact And.intro E.logCorrelatedClosed
    (And.intro E.multifractalSpectrumClosed E.extremalProcessDistributionClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse