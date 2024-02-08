---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ include "common.fullname" . }}-public
  namespace: {{ .Release.Namespace }}
  labels:
    {{- include "common.apiLabels" . | nindent 4 }}
spec:
  # TODO parametrize secretName
  secretName: api-ingress-public-tls
  dnsNames:
    - {{ .Values.api.ingresses.public_domain }}
  issuerRef:
    name: public-issuer
    kind: ClusterIssuer
