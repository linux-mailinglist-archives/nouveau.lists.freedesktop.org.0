Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88D608037
	for <lists+nouveau@lfdr.de>; Fri, 21 Oct 2022 22:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F2110E234;
	Fri, 21 Oct 2022 20:49:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C0110E234
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 20:49:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60ED260D3F;
 Fri, 21 Oct 2022 20:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885F2C433D6;
 Fri, 21 Oct 2022 20:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1666385382;
 bh=vrc+lI5+SR8a4So4X6IrwuExuB/rmti0raOq9LxnBJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2NTpjctEKYj/Z4ntsixF89OAVI1TYUhaJ6GmWCPYQOOwTO5yK/21nshmIxAy+3+Cs
 9AdhqI2EludheXQi8k/YbrDtl5XkhckabnrzI0HR2uSt6WDXVtZukBF6HtOBr+hE/E
 qNRpKO+ULktNISIpTcPaPNoN8HQvHxcMGzpcANF0=
Date: Fri, 21 Oct 2022 13:49:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lyude Paul <lyude@redhat.com>
Message-Id: <20221021134941.8b667fd86087be61c22c3593@linux-foundation.org>
In-Reply-To: <bdaca873243ca55de9b286d732c46729f2d96415.camel@redhat.com>
References: <20221019122934.866205-1-apopple@nvidia.com>
 <bdaca873243ca55de9b286d732c46729f2d96415.camel@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: Fix migrate_to_ram() for faulting
 page
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022 15:53:19 -0400 Lyude Paul <lyude@redhat.com> wrote:

> > Hi Andrew/Ben, apologies I must have accidentally dropped this small hunk
> > when rebasing prior to sending v2 of the original series. Without this
> > migration from GPU to CPU won't work in Nouveau so hopefully one of you can
> > take this for v6.1-rcX. Thanks.
> 
> Hi!
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> I will push this to drm-misc-next in just a moment, thanks for the patch!

Linus merged it but minutes ago.
