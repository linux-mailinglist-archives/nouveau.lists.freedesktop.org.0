Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286599D8AD9
	for <lists+nouveau@lfdr.de>; Mon, 25 Nov 2024 18:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC0A10E18A;
	Mon, 25 Nov 2024 17:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mjUoHiAi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4B310E18A
 for <nouveau@lists.freedesktop.org>; Mon, 25 Nov 2024 17:00:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AB6EDA4188B;
 Mon, 25 Nov 2024 16:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA90C4CECE;
 Mon, 25 Nov 2024 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732554017;
 bh=BslX02ysV0l06v/oBy5uRjRx4lZqmrhZFOxXKtA54Tc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mjUoHiAiBnVs+CYUDKz3/3HBD5mqWXz872+iLzIOE7OwOdRKfhleJLeea0QT1jmfz
 drvKWpJO6ytaher9mfO1iifes2L2UDfItDMtraUCup4JDGj4Yyl0O5ld+NFH0pt6TA
 kNn+aZWebV6hcjIIWTT7mNOLB+JuzZMHkPO26fdrzscB+Jzdwd3pCWdDtux5iLFKbY
 nTO2La24/hPi8CO+/4it7RBPpEw7vHeQ0TpIeFHfbIKjM2FU74NfQCgXu0XUAbv6bb
 aambP2tCY1rHyXYOssTmwO3SW8qawxY/6kO0XdBwWZArB2Tf+t1ntco2+LZ6gffnpD
 RhilutDhEe5TQ==
Message-ID: <c54dae67-21c8-4fa1-90f1-12fdfb302c95@kernel.org>
Date: Mon, 25 Nov 2024 18:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: create module debugfs root
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20241030202952.694055-2-ttabi@nvidia.com>
 <20241125142639.9126-1-dakr@kernel.org>
 <1b289bc781c587de41ea489f9a014ca4c3f58491.camel@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <1b289bc781c587de41ea489f9a014ca4c3f58491.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/25/24 5:55 PM, Timur Tabi wrote:
> On Mon, 2024-11-25 at 15:25 +0100, Danilo Krummrich wrote:
>> Typically DRM drivers use the DRM debugfs root entry. However, since
>> Nouveau is heading towards a split into a core and a DRM driver, create
>> a module specific debugfs root directory.
>>
>> Subsequent patches make use of this new debugfs root in order to store
>> GSP-RM log bufferes (optionally beyond a device driver binding).
> 
> "buffers">
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>> Unless there are any concerns, I'll pick this patch and rebase Timur's patches
>> on top of it.
> 
> Well, my only concern is that my code assumes that it is the creator and
> destroyer of /sys/kernel/debug/nouveau, so I don't think it's going to be a
> simple rebase.

I already did the rebase; no action for you.

Lifetime wise we're good. We create the debugfs root entry before the driver is 
registered in module_init() and it's removed after the driver is unregistered in 
module_exit().
