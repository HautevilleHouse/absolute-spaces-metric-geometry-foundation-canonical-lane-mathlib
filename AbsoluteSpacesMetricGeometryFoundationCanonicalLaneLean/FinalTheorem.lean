import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean

def ConstrainedAbsoluteSpacesMetricGeometryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem absolute_spaces_metric_geometry_endgame (A : AdmissibleClass) :
    ConstrainedAbsoluteSpacesMetricGeometryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean
end HautevilleHouse