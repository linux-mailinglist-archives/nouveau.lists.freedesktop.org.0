Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53CC73739D
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1065810E30D;
	Tue, 20 Jun 2023 18:16:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DC810E30D
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 18:15:59 +0000 (UTC)
Date: Tue, 20 Jun 2023 18:15:51 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="Ok/pIhGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687284952; x=1687544152;
 bh=r+cjdol+ePEhSgSDwiwVOcI82Gms+opxLXafMwB8bgs=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Ok/pIhGBSQiLjYvKyfCxuDjR05e/RQaJLoy7izQdLNx1bqU0/f4K1a+cTkK9o2Z7R
 AN2MqYZy92QUMEMT4/Esq3OY1hChmVbxB3Ubii61rXwuM65+6M9GuIuFMx8+pnC0KD
 9OL6TaBJP27KwaSL/J/nTyxX0N2TsYZQlfiebzZPLv0rosaCfC5t8SL4HgOZRQdUOZ
 73GALQH8RA3brLE89yEFp4VfQ31Q7OE2WM5meO/QZXipyldNjk6i8RzYOxm1DSYRkF
 MPbJEoD0ituv6iNBUPIjUnKZ5cadTNm1Kt5UYM0l/fAsWrvi38/SGYWhhBXk0drFKK
 Femhlg6/beD+g==
To: nouveau@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Message-ID: <20230620181547.272476-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [Nouveau] [PATCH] drm/nouveau/disp: use
 drm_kms_helper_connector_hotplug_event()
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This adds more information to the hotplug uevent and lets user-space
know that it's about a particular connector only.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/no=
uveau/nouveau_display.c
index ec3ffff487fc..99977e5fe716 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -465,7 +465,8 @@ nouveau_display_hpd_work(struct work_struct *work)
 =09struct drm_connector *connector;
 =09struct drm_connector_list_iter conn_iter;
 =09u32 pending;
-=09bool changed =3D false;
+=09int changed =3D 0;
+=09struct drm_connector *first_changed_connector =3D NULL;
=20
 =09pm_runtime_get_sync(dev->dev);
=20
@@ -509,7 +510,12 @@ nouveau_display_hpd_work(struct work_struct *work)
 =09=09if (old_epoch_counter =3D=3D connector->epoch_counter)
 =09=09=09continue;
=20
-=09=09changed =3D true;
+=09=09changed++;
+=09=09if (!first_changed_connector) {
+=09=09=09drm_connector_get(connector);
+=09=09=09first_changed_connector =3D connector;
+=09=09}
+
 =09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s (ep=
och counter %llu->%llu)\n",
 =09=09=09    connector->base.id, connector->name,
 =09=09=09    drm_get_connector_status_name(old_status),
@@ -520,9 +526,14 @@ nouveau_display_hpd_work(struct work_struct *work)
 =09drm_connector_list_iter_end(&conn_iter);
 =09mutex_unlock(&dev->mode_config.mutex);
=20
-=09if (changed)
+=09if (changed =3D=3D 1)
+=09=09drm_kms_helper_connector_hotplug_event(first_changed_connector);
+=09else if (changed > 0)
 =09=09drm_kms_helper_hotplug_event(dev);
=20
+=09if (first_changed_connector)
+=09=09drm_connector_put(first_changed_connector);
+
 =09pm_runtime_mark_last_busy(drm->dev->dev);
 noop:
 =09pm_runtime_put_autosuspend(dev->dev);
--=20
2.41.0


