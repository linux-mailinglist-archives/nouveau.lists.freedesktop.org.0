Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E9189587
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 07:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F596E869;
	Wed, 18 Mar 2020 06:02:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623116E1C0;
 Wed, 18 Mar 2020 06:02:57 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D12920663;
 Wed, 18 Mar 2020 06:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584511376;
 bh=rrtQ7bSEmpqBZhNRWvjkSCXBWymjQBTAn4TLG3GnOZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0lVSe2EwSW1Aav+XG39anTMGM7F1meUK3FdwawjmTFjZlQyGLrGK9qqCHfcsct4T
 3lqrOWxqsAmxx40aM1cDyecMhZgbnZ5k5wj0V2uti4WJBtkKnM+UmoPt5KL77JlLLt
 y0o1GB0j+wSmprz+VHDU0o9yNTp6+PQkVm/JqTU4=
Date: Wed, 18 Mar 2020 07:02:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20200318060254.GB1594891@kroah.com>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-10-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318004159.235623-10-lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH 9/9] drm/nouveau/kms/nvd9-: Add CRC support
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 08:41:06PM -0400, Lyude Paul wrote:
> +	root = debugfs_create_dir("nv_crc", crtc->debugfs_entry);
> +	if (IS_ERR(root))
> +		return PTR_ERR(root);

No need to check this, just take the return value and move on.

> +
> +	dent = debugfs_create_file("flip_threshold", 0644, root, head,
> +				   &nv50_crc_flip_threshold_fops);
> +	if (IS_ERR(dent))
> +		return PTR_ERR(dent);

No need to check this either, in fact this test is incorrect :(

Just make the call, and move on.  See the loads of debugfs cleanups I
have been doing for examples.

thanks,

greg k-h
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
