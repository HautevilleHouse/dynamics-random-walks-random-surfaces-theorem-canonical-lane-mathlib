import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean

structure BoundaryDisorderOrderParameter where
  disorderPotential : Type u
  correlationDecay : Prop
  interfaceWidthScaling : Prop
  criticalExponent : Prop

structure BoundaryDisorderOrderParameterEvidence (B : BoundaryDisorderOrderParameter) where
  correlationDecayClosed : B.correlationDecay
  interfaceWidthScalingClosed : B.interfaceWidthScaling
  criticalExponentClosed : B.criticalExponent

def BoundaryDisorderOrderParameterClosed (B : BoundaryDisorderOrderParameter) : Prop :=
  B.correlationDecay ∧ B.interfaceWidthScaling ∧ B.criticalExponent

theorem boundary_disorder_order_parameter_closed_from_evidence
    (B : BoundaryDisorderOrderParameter) (E : BoundaryDisorderOrderParameterEvidence B) :
    BoundaryDisorderOrderParameterClosed B := by
  exact And.intro E.correlationDecayClosed
    (And.intro E.interfaceWidthScalingClosed E.criticalExponentClosed)

end DynamicsRandomWalksRandomSurfacesTheoremCanonicalLaneLean
end HautevilleHouse