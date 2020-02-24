Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4B169FB6
	for <lists+nouveau@lfdr.de>; Mon, 24 Feb 2020 09:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E196E195;
	Mon, 24 Feb 2020 08:04:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB056E192
 for <nouveau@lists.freedesktop.org>; Mon, 24 Feb 2020 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582531464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kf7GST9fk8uTcZgslluWz97Hyc5RANSQq3UtFOeXkYo=;
 b=O0j5EkX+iwbwEl43RDiuBrGgXZvZalLbEMxtZSjMrFr1b8c8nk195ONFGW05mNNRNs07gt
 lerIKfhdZTvzWjAH7SXwecuNnJtxCbI+DTqepmy9Ku3iD9UmJ9lsQZFNIVBiVpVSdPmkxm
 NBC2l8XTcX9c3HJewe4spxrqh7cA+dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-So_lvQODNCmE5ohAMnyHRg-1; Mon, 24 Feb 2020 03:04:22 -0500
X-MC-Unique: So_lvQODNCmE5ohAMnyHRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB69F107ACC9;
 Mon, 24 Feb 2020 08:04:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5D45909E5;
 Mon, 24 Feb 2020 08:04:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA7CF1747F; Mon, 24 Feb 2020 09:04:18 +0100 (CET)
Date: Mon, 24 Feb 2020 09:04:18 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Nirmoy <nirmodas@amd.com>
Message-ID: <20200224080418.3cggiohw43afc2hp@sirius.home.kraxel.org>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
MIME-Version: 1.0
In-Reply-To: <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH 8/8] drm/ttm: do not keep GPU dependent
 addresses
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

  Hi,

> 2 unfortunately I can't say the same for bochs but it works with this patch
> series so I think bochs is fine as well.

bochs needs the offset only to scanout framebuffers, which in turn
requires framebuffers being pinned to vram.  So all green here.

cheers,
  Gerd

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
