Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67722326E1
	for <lists+nouveau@lfdr.de>; Wed, 29 Jul 2020 23:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF1E6E2E6;
	Wed, 29 Jul 2020 21:37:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA5C6E2E6
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596058631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wtede60DfREPYe8+lwF/oUyLMl6SXrsOzr+b3kM5CHs=;
 b=H7pQZftvxeFgPdq08IBN68DuTDGQMH8NylY4fTvTkAT8WHngoawdBm93ibc/NRyfSyvKq8
 cdJVFxI/C5QF6GJ4YdP2NXiSUTXIztzwOOUbSgEY/sn6T7YzObRS2K+NR5hzSzrebtaEdA
 xXgUc+gkU9WJNeh6JCNwEVvPnH09U3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-xfyKEzuOOeqWw6ujMd9tYQ-1; Wed, 29 Jul 2020 17:37:09 -0400
X-MC-Unique: xfyKEzuOOeqWw6ujMd9tYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4C0E1005504
 for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2020 21:37:08 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-146.rdu2.redhat.com [10.10.119.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBF260C84;
 Wed, 29 Jul 2020 21:37:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 29 Jul 2020 17:36:54 -0400
Message-Id: <20200729213703.119137-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/9] drm/nouveau/kms: A bunch of runtime_pm fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

While working on refactoring how we handle connector hotplugging/probing
+ a bunch of misc DP stuff, I found a bunch of runtime_pm errors that
were mostly introduced by me at one point. Oops. A lot of these aren't
triggered consistently on a lot of systems, so it's not terribly
surprising these got swept under the rug.

Lyude Paul (9):
  drm/nouveau/kms: Handle -EINPROGRESS in nouveau_connector_hotplug()
  drm/nouveau/kms: Fix rpm leak in nouveau_connector_hotplug()
  drm/nouveau/kms/fbcon: Correct pm_runtime calls in
    nouveau_fbcon_release()
  drm/nouveau/kms/fbcon: Fix pm_runtime calls in
    nouveau_fbcon_output_poll_changed()
  drm/nouveau/kms/fbcon: Use pm_runtime_put_autosuspend() in suspend
    work
  drm/nouveau/kms: Use pm_runtime_put_autosuspend() in hpd_work
  drm/nouveau/kms: Invert conditionals in nouveau_display_acpi_ntfy()
  drm/nouveau/kms: Fix runtime PM leak in nouveau_display_acpi_ntfy()
  drm/nouveau/kms: Handle -EINPROGRESS in nouveau_display_acpi_ntfy()

 drivers/gpu/drm/nouveau/nouveau_connector.c |  5 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   | 52 ++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     | 18 ++++---
 3 files changed, 41 insertions(+), 34 deletions(-)

-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
