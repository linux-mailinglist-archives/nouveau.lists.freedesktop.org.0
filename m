Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07553D3CD3
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 17:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7E36E9E1;
	Fri, 23 Jul 2021 15:52:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEF0D6E9E1;
 Fri, 23 Jul 2021 15:52:31 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 1A1C57A003B;
 Fri, 23 Jul 2021 17:52:31 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Jul 2021 17:52:28 +0200
User-Agent: KMail/1.9.10
References: <202107222122.05546.linux@zary.sk>
 <CACO55tvq0Ksm6x_L3r6B8KhYR6dTqb=xzPaRzAeQgaBnff_sYA@mail.gmail.com>
 <CAKMK7uGee+A2hzY8meXnBAWDuQGs=c=3oww8-JxMJWxF8_kR=A@mail.gmail.com>
In-Reply-To: <CAKMK7uGee+A2hzY8meXnBAWDuQGs=c=3oww8-JxMJWxF8_kR=A@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202107231752.28531.linux@zary.sk>
Subject: Re: [Nouveau] nouveau broken again on Riva TNT2 in 5.14.0-rc2
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Friday 23 July 2021 09:26:10 Daniel Vetter wrote:
> On Thu, Jul 22, 2021 at 9:51 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > hey thanks for the report.
> >
> > This is a known issue and the fix is pending in drm-mist-fixes and
> > should land in 5.14 soonish.
> 
> It just landed in Linus' tree yesterday, please retest that or -rc3.
> If it's still broken it's something else.
> -Daniel

Thanks, it works!

-- 
Ondrej Zary
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
