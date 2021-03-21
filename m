Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459B34359C
	for <lists+nouveau@lfdr.de>; Mon, 22 Mar 2021 00:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D6689E0C;
	Sun, 21 Mar 2021 23:05:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Sun, 21 Mar 2021 23:05:26 UTC
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A39B89E50
 for <nouveau@lists.freedesktop.org>; Sun, 21 Mar 2021 23:05:26 +0000 (UTC)
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id D17A8F202F7
 for <nouveau@lists.freedesktop.org>; Sun, 21 Mar 2021 22:58:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org D17A8F202F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1616367488;
 bh=rkx3yBZJgL/5upNugXo7t76ldEte7e+gNcZrIW8odt4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=RpF03bjD5a10YXd6/OfbaP2iAqD73JTjmt7yJbUmu/sWoAjUhGw9CqgsRwXcbf3Vp
 iXU4kRwH4n5dfRuArRISnWVoI0QN14b/o5T8k8O7ro+EkAdJpju0hWoq6QhTWzKtUm
 9wRciHV3h3FzPwVpNKnkNegIGJfWRtE7hsw8oUJ8=
To: nouveau@lists.freedesktop.org
References: <20210305222135.1269175-1-lyude@redhat.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <dcb3f3e4-6eef-fcc1-836a-7729ad045921@spliet.org>
Date: Sun, 21 Mar 2021 22:58:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210305222135.1269175-1-lyude@redhat.com>
Content-Language: en-GB
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on Neelix
X-Virus-Scanned: clamav-milter 0.103.1 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau/kms/nve4-nv108: Don't
 advertise 256x256 cursor support yet
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Tested-by: Roy Spliet <nouveau@spliet.org>

Op 05-03-2021 om 22:21 schreef Lyude Paul:
> While Kepler does technically support 256x256 cursors, it turns out that
> in order for us to use these correctly we need to make sure that the cursor
> plane uses a ctxdma that is set to use small (4K)/large (128K) pages -
> whichever is applicable to the given cursor surface.
> 
> Right now however, we share the main kmsVramCtxDma that is used for all but
> the ovly plane which defaults to small pages - resulting in artifacts when
> we use 256x256 cursor surfaces. So until we teach nouveau to use a separate
> ctxdma for the cursor, let's just stop advertising 256x256 cursors by
> default - which should fix the issues that users were seeing.
> 
> Coincidentally - this is also why small ovlys don't work on Kepler: the
> ctxdma we use for ovlys is set to large pages.
> 
> Changes since v2:
> * Fix comments and patch description
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: d3b2f0f7921c ("drm/nouveau/kms/nv50-: Report max cursor size to userspace")
> Cc: <stable@vger.kernel.org> # v5.11+
> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 196612addfd6..d92cf9e17ac3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2693,9 +2693,19 @@ nv50_display_create(struct drm_device *dev)
>   	else
>   		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
>   
> -	if (disp->disp->object.oclass >= GK104_DISP) {
> +	/* FIXME: 256x256 cursors are supported on Kepler, however unlike Maxwell and later
> +	 * generations Kepler requires that we specify the page type, small (4K) or large (128K),
> +	 * correctly for the ctxdma being used on curs/ovly. We currently share a ctxdma across all
> +	 * display planes (except ovly) that defaults to small pages, which results in artifacting
> +	 * on 256x256 cursors. Until we teach nouveau to create an appropriate ctxdma for the cursor
> +	 * fb in use, simply avoid advertising support for 256x256 cursors.
> +	 */
> +	if (disp->disp->object.oclass >= GM107_DISP) {
>   		dev->mode_config.cursor_width = 256;
>   		dev->mode_config.cursor_height = 256;
> +	} else if (disp->disp->object.oclass >= GK104_DISP) {
> +		dev->mode_config.cursor_width = 128;
> +		dev->mode_config.cursor_height = 128;
>   	} else {
>   		dev->mode_config.cursor_width = 64;
>   		dev->mode_config.cursor_height = 64;
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
