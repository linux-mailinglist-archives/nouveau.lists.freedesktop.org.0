Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C13FB5C2
	for <lists+nouveau@lfdr.de>; Mon, 30 Aug 2021 14:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A0789CBA;
	Mon, 30 Aug 2021 12:18:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2B689CB2;
 Mon, 30 Aug 2021 12:17:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98CA560E77;
 Mon, 30 Aug 2021 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630325877;
 bh=Dj+5yK8xpFom0mCcZ7jfHLC+VMnh/en5i7qChO92frY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RfxnPzOqNMUipBFtamdNjXUyKphDTUVdbyQpodkhoYbs7kHS8CdJykSsn6VtHn1KC
 wEDW+t50EQVgwAR5iKt7MuwGJWFMl6bWXWJu4dtwwEew070HWnhJssrCSWTxLE0UMM
 e+PE4A7rRPrAFbr1eyOx5/ke3ZVWFN0AuhpanAkndBMmwl6gFrGC22cd3n92AP4kSP
 rCI9j00lg7c+Ph91T3ppKbgJCT0VTtgcT/aRe07zNCjNXmnlqi2+ooNzzgytBndvmO
 G8VPw2B543LXFzBXQCs4Ccyx4LVv0ZNK5Nqb2rA7RXnUob133dw7d1LU+EUvxSB+DE
 3xn4JBnvg+YWQ==
Date: Mon, 30 Aug 2021 08:17:56 -0400
From: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <YSzMdH4E1jIJd5Ed@sashalap>
References: <20210824005528.631702-1-sashal@kernel.org>
 <20210824005528.631702-6-sashal@kernel.org>
 <75ccbdea6e8871856002edb75dff1a32822a5a89.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <75ccbdea6e8871856002edb75dff1a32822a5a89.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH AUTOSEL 4.14 6/7] drm/nouveau: block a bunch
 of classes from userspace
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

On Tue, Aug 24, 2021 at 01:05:32PM -0400, Lyude Paul wrote:
>This isn't at all intended to be a fix to be backported, so I don't think this
>should be included. I don't know about 5/7, but I'll let Benjamin comment on
>that one

I'll drop it, thanks!

-- 
Thanks,
Sasha
