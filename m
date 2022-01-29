Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13FD4A2D2A
	for <lists+nouveau@lfdr.de>; Sat, 29 Jan 2022 09:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0EE10F986;
	Sat, 29 Jan 2022 08:33:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA3E10F982;
 Sat, 29 Jan 2022 08:33:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4DFE5B80CA0;
 Sat, 29 Jan 2022 08:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA6C340E5;
 Sat, 29 Jan 2022 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643445183;
 bh=qYtXeLAkgSSnf9W7arwFjXpYcJVeJmHx7Z6ifsGLxh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CtFEs+7zy1Beu8UwRQUXnpvGLbi3PhO3WDCd6W7iEE1fbcUQNs01ZczlZ3AkbzbgS
 cyQRjxTS3ULqARCcmsgN8BZaULAJl/Ev/+xHYRhF/VRlx7+HnbkAxEsQBnP9DBwrhZ
 aRdkvMFa9eYhNsOUcC+QUIUWO06QxMDtsUZxelrg=
Date: Sat, 29 Jan 2022 09:33:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YfT7vMmd8TdhzLVH@kroah.com>
References: <20220128192951.626532-1-lyude@redhat.com>
 <8a01bf1d367a702cd41e6cb1281294e82a48f541.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a01bf1d367a702cd41e6cb1281294e82a48f541.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH] Revert "drm/nouveau/acr: Fix undefined
 behavior in nvkm_acr_hsfw_load_bl()"
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 02:59:42PM -0500, Lyude Paul wrote:
> on further reconsideration: Self-NAKing this. I don't see any issues with
> those patches.

I agree, the original change looks correct here.  Thanks for the
re-review.

greg k-h
