Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF691B3436
	for <lists+nouveau@lfdr.de>; Wed, 22 Apr 2020 02:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8779A6E041;
	Wed, 22 Apr 2020 00:55:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C26E041;
 Wed, 22 Apr 2020 00:55:25 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04B0C2071E;
 Wed, 22 Apr 2020 00:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587516925;
 bh=1tGsEv5ZFp9bX2M6Kx0sfhTv+0ZAGMG4B0V9Zh/NRjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iIZ/ySE32plEgTzSYEoFVxtu2f+Ees6F8/H9+vpBCrjILSB53HY7a8zDlU8Gy28XU
 jGiV89vqnJFzcW0fhZ9EGuSjUKvNuvecXtgtyjDYvuFctHpqyN6JQqTBVoTUds1Ln7
 wDuYMMNFP5kbg/+flHoTivANtUtqEQz1ewVHUmFU=
Date: Tue, 21 Apr 2020 20:55:23 -0400
From: Sasha Levin <sashal@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20200422005523.GV1809@sasha-vm>
References: <20200415113445.11881-1-sashal@kernel.org>
 <20200415113445.11881-84-sashal@kernel.org>
 <CACO55ttpvfoyt1p_5Y-Q1=+5NruF5kMoug85jE9y+jG+FW=HGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55ttpvfoyt1p_5Y-Q1=+5NruF5kMoug85jE9y+jG+FW=HGw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH AUTOSEL 5.6 084/129] drm/nouveau: workaround
 runpm fail by disabling PCI power management on certain intel bridges
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 06:11:10PM +0200, Karol Herbst wrote:
>in addition to that 028a12f5aa829 "drm/nouveau/gr/gp107,gp108:
>implement workaround for HW hanging during init" should probably get
>picked as well as it's fixing some runtime pm related issue on a
>handful of additional GPUs. I have a laptop myself which requires both
>of those patches.
>
>Applies to 5.5 and 5..4 as well.

I've grabbed it for 5.6 and 5.4 (5.5 is EOL), thanks!

-- 
Thanks,
Sasha
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
