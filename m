Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1415CE32
	for <lists+nouveau@lfdr.de>; Thu, 13 Feb 2020 23:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63FC6E41D;
	Thu, 13 Feb 2020 22:39:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE41E6E41D;
 Thu, 13 Feb 2020 22:39:32 +0000 (UTC)
Received: from localhost (unknown [104.132.1.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51AC22168B;
 Thu, 13 Feb 2020 22:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581633572;
 bh=O2POkiVQUM25p+6MaEzRDEnLeyBlPNXNvgjiDShqYAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W5fC5lPx48yZKVrNY4T0N0U2Fg7NQ2totx+JfUR6nohfmqTt0KcJf9bEoHhwecjvN
 41Kfwu5qu9j9domk5jDJhgYakB/7mUUp/wHAE3vTXCPoDgmZ4fhCkA4N5/VfyQIJWt
 KwCDnHBLevUou9ZBGbnYSmhrmc+ngcxF/DOr3YM8=
Date: Thu, 13 Feb 2020 14:39:31 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200213223931.GA3877216@kroah.com>
References: <20200209105525.GA1620170@kroah.com>
 <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
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
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 02:30:09PM -0800, John Hubbard wrote:
> On 2/9/20 2:55 AM, Greg Kroah-Hartman wrote:
> > When calling debugfs functions, there is no need to ever check the
> > return value.  The function can work or not, but the code logic should
> > never do something different based on this.
> > 
> 
> Should we follow that line of reasoning further, and simply return void
> from the debugfs functions--rather than playing whack-a-mole with this
> indefinitely?

That is what we (well I) have been doing.  Look at all of the changes
that have happened to include/linux/debugfs.h over the past few
releases.  I'm slowly winnowing down the api to make it impossible to
get wrong for this type of thing, and am almost there.

DRM is the big fish left to tackle, I have submitted some patches in the
past, but lots more cleanup needs to be done to get them into mergable
shape.  I just need to find the time...

thanks,

greg k-h
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
