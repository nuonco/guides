---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.fullname" . }}
  labels:
    {{- include "common.apiLabels" . | nindent 4 }}
  namespace: {{ .Release.Namespace }}
spec:
  clusterIP: None
  ports:
    - name: http
      port: 80
      targetPort: api
    - name: https
      port: 443
      targetPort: api
  selector:
    {{- include "common.apiSelectorLabels" . | nindent 4 }}
