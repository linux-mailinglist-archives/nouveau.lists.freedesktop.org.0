Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80022292C54
	for <lists+nouveau@lfdr.de>; Mon, 19 Oct 2020 19:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6615C6E950;
	Mon, 19 Oct 2020 17:06:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37276E957;
 Mon, 19 Oct 2020 17:06:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8701D80553;
 Mon, 19 Oct 2020 19:06:42 +0200 (CEST)
Date: Mon, 19 Oct 2020 19:06:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: trix@redhat.com
Message-ID: <20201019170641.GA963808@ravnborg.org>
References: <20201019163115.25814-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019163115.25814-1-trix@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8
 a=ZcYGe4iLqmrVLVjp7M0A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Subject: Re: [Nouveau] [PATCH] drm: remove unneeded break
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kraxel@redhat.com, daniel@ffwll.ch, spice-devel@lists.freedesktop.org,
 airlied@redhat.com, virtualization@lists.linux-foundation.org,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Tom
On Mon, Oct 19, 2020 at 09:31:15AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return or break
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Looks good and builds with no warnings.

One of the diffs made me - "oh this looks wrong". But after I looked again
it was right and the resulting code is more readable - so good.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

Was tempted to just apply to drm-misc-next but will give others the
opportunity to chime in.

	Sam
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
