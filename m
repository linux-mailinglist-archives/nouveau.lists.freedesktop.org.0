Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6E3FBE99
	for <lists+nouveau@lfdr.de>; Mon, 30 Aug 2021 23:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9C389BDB;
	Mon, 30 Aug 2021 21:55:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E298C89BDB;
 Mon, 30 Aug 2021 21:55:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7994E60ED8;
 Mon, 30 Aug 2021 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630360507;
 bh=W3FLU8gKLc9GCcD7kgJR6yhTYKb+vrDK6w3Axm758MA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZR0pdRppx4wUEaNfzSf7iTfZVQD1Tfoe3bH0ibMgfO12yGf29NeVQFwta5YFgPPq
 lIqOPOUohjBVuxc9y2AIRLtSGvV8o6EpeJQrEFwqctMFBsXZxOiaD7rk3D1pQ/IdRy
 UG6Dpn1k0nXeGpUY7vitD/jBjoccq7nN7l3bBXyIoCRTNmOR4cGZTXS+99W6tlBN4K
 MBnI/w5SYgssZBRonBlmkJGNgsaNq7vwFuCUxyo5++me0EtwYD+y8Ca9jhSlqQ7P3j
 hxX0fj19CGwlRXcnl36YQV+S2lCY7M0IolCEl2qyrvRCimJTy6QiFSHymReJnPBTMG
 CwwND/xBZggNg==
Date: Mon, 30 Aug 2021 17:55:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <YS1TuuepU+VpVvcp@sashalap>
References: <20210824005356.630888-1-sashal@kernel.org>
 <20210824005356.630888-20-sashal@kernel.org>
 <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
 <YSzMR4FnrnT5gjbe@sashalap>
 <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
 <0777c34ddbd22ae247d293cf013cb763947b0b50.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0777c34ddbd22ae247d293cf013cb763947b0b50.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH AUTOSEL 5.13 20/26] drm/nouveau: recognise
 GA107
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

On Mon, Aug 30, 2021 at 01:09:24PM -0400, Lyude Paul wrote:
>oops-except for "drm/nouveau: block a bunch of classes from userspace" of
>course. the rest are fine though

Yup, that one is gone :)

-- 
Thanks,
Sasha
