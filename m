Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E033FB5E
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D8B6E84F;
	Wed, 17 Mar 2021 22:42:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227AA6E850
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616020952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AhqLDqQUc1V3OVHPYu9cG3vtELN+kL3384hRUunqRWc=;
 b=ff8akiwfekQNkX/mt66BXu2JpYQgSWvUDqNdD18UlZlmArycdifKL7newAuJsKybjEUxD9
 Jejtn+LttVVZxg0Xas3FZwG7VtVeEBzyWjtAd3gGeXVieYvqSxdV5pd/dwJ/gkGFEGf3qk
 b/yUwhh9SJx+fbV0M36fuG4jHSFMXQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-svujb4XINNmd7F2NKG5moQ-1; Wed, 17 Mar 2021 18:42:30 -0400
X-MC-Unique: svujb4XINNmd7F2NKG5moQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F9B81621;
 Wed, 17 Mar 2021 22:42:29 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A49F1007625;
 Wed, 17 Mar 2021 22:42:28 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:42:19 -0400
Message-Id: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 0/3] tests/kms_color: Fixup for nouveau
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

This patch series just introduces a small drive-by cleanup for
kms_color, and fixes the kms_color test so that it works correctly on
nouveau. Note that the invalid LUT/gamma tests will likely currently
fail, but I'm going to be submitting some kernel patches to fix these in
nouveau very shortly.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>

Lyude Paul (3):
  tests/kms_color: Don't opencode igt_check_crc_equal()
  tests/kms_color: Allow tests to run on any driver
  tests/kms_color: Stop leaking fbs

 tests/kms_color.c        | 15 +++++++++++++--
 tests/kms_color_helper.c |  6 ------
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
