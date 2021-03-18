Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68D34104C
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 23:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780516E1A5;
	Thu, 18 Mar 2021 22:21:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63A86E1A8
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616106098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XJcAkiabQJxLBhJ0WEIux0Ss1FM5GZz1+5E0CgrPcxw=;
 b=H6Ejmcrwo+7YS4k45ndRgrXUuoLA/6T6c3IaBrfOd3ez+oDr3fcqus2VbcxfnPKoOL3PDe
 jeUggyikT6rxfWD5t5UZ0jt7VJ6ru2HfmDarTvWZ2XZWXCJVe3znVb+UY9FFb1NirI5d+j
 y0aMnLCRZEmmXJchlQJN243FvQLKuas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-2NZYmzXbPqKeKoKF2qBNoQ-1; Thu, 18 Mar 2021 18:21:34 -0400
X-MC-Unique: 2NZYmzXbPqKeKoKF2qBNoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C060F8018A9;
 Thu, 18 Mar 2021 22:21:33 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-18.rdu2.redhat.com [10.10.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA4E60CD7;
 Thu, 18 Mar 2021 22:21:32 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Thu, 18 Mar 2021 18:21:22 -0400
Message-Id: <20210318222124.970997-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v2 0/2] tests/kms_cursor_crc: Test 32x32
 cursors
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Older nvidia hardware only has 32x32 and 64x64 cursors, so we want to
make sure to test 32x32 cursors.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>

Lyude Paul (2):
  tests/kms_cursor_crc: Probe kernel for cursor size support
  tests/kms_cursor_crc: Test 32x32 cursors

 tests/kms_cursor_crc.c | 133 ++++++++++++++++++++++++-----------------
 1 file changed, 77 insertions(+), 56 deletions(-)

-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
