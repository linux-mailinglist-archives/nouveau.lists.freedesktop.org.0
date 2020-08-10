Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95908241235
	for <lists+nouveau@lfdr.de>; Mon, 10 Aug 2020 23:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD489E1B;
	Mon, 10 Aug 2020 21:18:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5645789E1B
 for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2020 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597094324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T9Uxrd9ooj3MtmaPo8dy4lq/HM/vrp+JdTA0Rj+wgAo=;
 b=eiQg2wUDScbeBXX253VMu8kFMX7ArWceJjJwmCWkHFWQArr98q31O+QN5uDC7PX90PkAiL
 WkXIrnWAiisRGsXBuYfYFJ0ZH8CrEYTkZlH5u58CdGi70GumdTHktNvsYmCT1cYQP1xMmT
 IkjF5azdncIQA84TSj4Hsv/lGUWCuJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-C_ICWSSZOw6R5wUVUymfxw-1; Mon, 10 Aug 2020 17:18:42 -0400
X-MC-Unique: C_ICWSSZOw6R5wUVUymfxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6871F1009442
 for <nouveau@lists.freedesktop.org>; Mon, 10 Aug 2020 21:18:41 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E78879CF3;
 Mon, 10 Aug 2020 21:18:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 10 Aug 2020 17:18:36 -0400
Message-Id: <20200810211838.37862-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/2] drm/nouveau: Small CRC fixes for 5.9
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

Just two CRC related fixes for the new CRC functionality in 5.9. One of
these unbreaks CRC reporting on volta+, which accidentally got broken
when converting over to nvidia's class headers. The other simply removes
an unneeded CRC method call that's been hiding in head907d_mode() for
quite a while now.

Lyude Paul (2):
  drm/nouveau/kms/nv140-: Include correct push header in crcc37d.c
  drm/nouveau/kms/nv50-: Don't call HEAD_SET_CRC_CONTROL in
    head907d_mode()

 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/head907d.c | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
