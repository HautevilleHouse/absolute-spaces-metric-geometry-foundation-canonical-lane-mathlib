import canonicalLaneMathlib.AdmissibleClass
import AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AbsoluteSpaceWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end AbsoluteSpacesMetricGeometryFoundationCanonicalLaneLean
end HautevilleHouse