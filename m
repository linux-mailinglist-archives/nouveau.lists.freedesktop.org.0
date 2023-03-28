Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B396CCAF9
	for <lists+nouveau@lfdr.de>; Tue, 28 Mar 2023 21:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EC610E0FC;
	Tue, 28 Mar 2023 19:56:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A9410E0FC
 for <nouveau@lists.freedesktop.org>; Tue, 28 Mar 2023 19:56:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E118F618EE;
 Tue, 28 Mar 2023 19:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A505C433D2;
 Tue, 28 Mar 2023 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1680033359;
 bh=CTUYWxXd+yObk4y3y8I0yB5B0x34p6sstzdIplNE/MY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ndgJDNC99FdKm17ufZ4sHC9DW142inlGKABvkR2/faxej3EvezmIbbnMz02mMTG/i
 iNj9OBiK9MoLyDMHEEOAPe0jJ09f47P8aHm6FiR+R8e7LBGG5GhkcHXWEvV/lUQlKB
 h07VpFTLIbI6IUEVVaMEDGdKaixmxr2SWHvBQYt4=
Date: Tue, 28 Mar 2023 12:55:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-Id: <20230328125558.90cf40060e238b24add51d23@linux-foundation.org>
In-Reply-To: <538f85fc-3cc7-de5c-131e-ba776d5f35b5@nvidia.com>
References: <20230328021434.292971-1-apopple@nvidia.com>
 <538f85fc-3cc7-de5c-131e-ba776d5f35b5@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] mm: Take a page reference when removing
 device exclusive entries
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
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, stable@vger.kernel.org,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 27 Mar 2023 23:25:49 -0700 John Hubbard <jhubbard@nvidia.com> wrote:

> On the patch process, I see that this applies to linux-stable's 6.1.y
> branch. I'd suggest two things:
> 
> 1) Normally, what I've seen done is to post against either the current
> top of tree linux.git, or else against one of the mm-stable branches.
> And then after it's accepted, create a version for -stable. 

Yup.  I had to jiggle the patch a bit because
mmu_notifier_range_init_owner()'s arguments have changed.  Once this
hits mainline, the -stable maintainers will probably ask for a version
which suits the relevant kernel version(s).

