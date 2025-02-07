Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E08FA2B7D9
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05910E9D1;
	Fri,  7 Feb 2025 01:27:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C6B10E9D1
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 01:26:43 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-iJjntMkPNvywx0bDZ2XQ3w-1; Thu,
 06 Feb 2025 20:25:36 -0500
X-MC-Unique: iJjntMkPNvywx0bDZ2XQ3w-1
X-Mimecast-MFC-AGG-ID: iJjntMkPNvywx0bDZ2XQ3w
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 441CD1800374; Fri,  7 Feb 2025 01:25:35 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.6])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6B4601800352; Fri,  7 Feb 2025 01:25:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@kernel.org
Subject: [PATCH] drm/nouveau: select FW caching
Date: Fri,  7 Feb 2025 11:25:31 +1000
Message-ID: <20250207012531.621369-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rHKKRKTY8qzE1tvnvSxzO8nEydUDHQEyCCi0upl0zSU_1738891535
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

nouveau tries to load some firmware during suspend that it loaded earlier, =
but with
fw caching disabled it hangs suspend, so just rely on FW cache enabling ins=
tead of
working around it in the driver.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM"=
)
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kcon=
fig
index ce840300578d8..1050a4617fc15 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -4,6 +4,7 @@ config DRM_NOUVEAU
 =09depends on DRM && PCI && MMU
 =09select IOMMU_API
 =09select FW_LOADER
+=09select FW_CACHE if PM_SLEEP
 =09select DRM_CLIENT_SELECTION
 =09select DRM_DISPLAY_DP_HELPER
 =09select DRM_DISPLAY_HDMI_HELPER
--=20
2.48.1

