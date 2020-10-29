Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D37429EB67
	for <lists+nouveau@lfdr.de>; Thu, 29 Oct 2020 13:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8D06ECB6;
	Thu, 29 Oct 2020 12:14:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363B6E5C6;
 Thu, 29 Oct 2020 05:42:43 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id s15so2130985ejf.8;
 Wed, 28 Oct 2020 22:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+zwvXGGP7Jimw9hLxGRvlejwQWtm5slzhppTkFSUgrc=;
 b=WbKSErVuGINgwsUDsevjbskrR0bSgOXC883odHRey+2/Qdy9DJZXr+39F8s16FMGfk
 ZZwQMHirjCYJRv0Y6OV87CPs6YQ/MfYuq3h/jQbxYg428P2CoWqhTxWk32HKTWXzsaBu
 EThAmmiDmnqWr7ULAX2NYJhIC4zI4o12dPYtcsmxD5Too5tLvODIfE85CtNxgIU8NRt4
 9zz1KwmunnZ61m6jFxP5kdAYcQMV229KkhuRi6DagQSLNY2QnfEaUpOYjK5CtyJw6f9V
 /eOL4Hob9W0xMXb6bE4Eo+A9xdVuvseaUdoF5aAj6fwgSUdSNsRKjT4BTvKGmM7OpC3b
 KOkg==
X-Gm-Message-State: AOAM530F5l3h7OwWCYsP4sNynGkcIGaJJlN9WkJMsHnmpTGhUenj2vio
 YdgRHcXbjcljXR9NwlMceXw=
X-Google-Smtp-Source: ABdhPJw5i2GtoHk0Z+/903xc3/UHEIgOGT7HU6IhTnJrybfyZcqMoiA/N78eBzz/0tY3oFIdhSNfSA==
X-Received: by 2002:a17:906:ce5c:: with SMTP id
 se28mr2290239ejb.365.1603950162313; 
 Wed, 28 Oct 2020 22:42:42 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id m19sm840452eda.72.2020.10.28.22.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 22:42:41 -0700 (PDT)
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <997267e5-40c1-2aaf-235a-ff14f2d101e6@kernel.org>
Date: Thu, 29 Oct 2020 06:42:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 29 Oct 2020 12:14:54 +0000
Subject: Re: [Nouveau] [PATCH] fbcon: Disable accelerated scrolling
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 nouveau@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Rosin <peda@axentia.se>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 28. 10. 20, 17:06, Daniel Vetter wrote:
> So ever since syzbot discovered fbcon, we have solid proof that it's
> full of bugs. And often the solution is to just delete code and remove
> features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
...
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1147,11 +1147,13 @@ static void fbcon_init(struct vc_data *vc, int init)
>   
>   	ops->graphics = 0;
>   
> -	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
> -	    !(cap & FBINFO_HWACCEL_DISABLED))
> -		p->scrollmode = SCROLL_MOVE;
> -	else /* default to something safe */
> -		p->scrollmode = SCROLL_REDRAW;
> +	/*
> +	 * No more hw acceleration for fbcon.
> +	 *
> +	 * FIXME: Garabge collect all the now dead code after sufficient time

If you go this non-invasive path, then only a nit here: "Garbage"

thanks,
-- 
js
suse labs
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
