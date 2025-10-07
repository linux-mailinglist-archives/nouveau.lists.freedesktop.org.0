Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676FBC267C
	for <lists+nouveau@lfdr.de>; Tue, 07 Oct 2025 20:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66A610E0CB;
	Tue,  7 Oct 2025 18:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="JmiN5OxO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6yA+USXg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JmiN5OxO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="6yA+USXg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CCF10E0CB
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 18:38:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8632D337A8;
 Tue,  7 Oct 2025 18:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759862299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4fE7Mq1rcZoFeFL/XO5vNF/ruwBwXL8n114CifXGEo=;
 b=JmiN5OxOb5/wWFaOYVsIffp7gLiMdUVUdOmBP+PX7S4SqGNQHjS0nt1P1fCffoONaO5q01
 873Xyq/JpUz8xbrh2XlNA+Sv/K9/QzoRGu5JxBSNXbZEGdp/WplCO6p4LnXahAeS7QbMj3
 q+PZ2YOekC2xVyS7bT0DF182bSImUms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759862299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4fE7Mq1rcZoFeFL/XO5vNF/ruwBwXL8n114CifXGEo=;
 b=6yA+USXgAu5EikMezcuitxktZ9b9DGqfOLiSwiNZxb4dBZ20cwcSrvFY1gJfJIZf2xXQqr
 0vwLRBe+QLS1JuBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=JmiN5OxO;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=6yA+USXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759862299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4fE7Mq1rcZoFeFL/XO5vNF/ruwBwXL8n114CifXGEo=;
 b=JmiN5OxOb5/wWFaOYVsIffp7gLiMdUVUdOmBP+PX7S4SqGNQHjS0nt1P1fCffoONaO5q01
 873Xyq/JpUz8xbrh2XlNA+Sv/K9/QzoRGu5JxBSNXbZEGdp/WplCO6p4LnXahAeS7QbMj3
 q+PZ2YOekC2xVyS7bT0DF182bSImUms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759862299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4fE7Mq1rcZoFeFL/XO5vNF/ruwBwXL8n114CifXGEo=;
 b=6yA+USXgAu5EikMezcuitxktZ9b9DGqfOLiSwiNZxb4dBZ20cwcSrvFY1gJfJIZf2xXQqr
 0vwLRBe+QLS1JuBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 743C013AAC;
 Tue,  7 Oct 2025 18:38:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VZbtFRpe5WisCAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 Oct 2025 18:38:18 +0000
Date: Tue, 7 Oct 2025 20:38:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Takashi Iwai <tiwai@suse.de>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Michael Vetter <mvetter@suse.com>
Subject: Re: [RFC PATCH 1/1] Avoid NOUVEAU_GETPARAM_HAS_VMA_TILEMODE on nv177
Message-ID: <20251007183816.GA147298@pevik>
References: <20251007152424.7322-1-pvorel@suse.cz>
 <CAOFGe96TGxbwwwUnz=NimY1vv=Fzr-S0KT3xq1xSS08MvKFAzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe96TGxbwwwUnz=NimY1vv=Fzr-S0KT3xq1xSS08MvKFAzA@mail.gmail.com>
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.cz:replyto,suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,redhat.com,collabora.com,suse.com];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8632D337A8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.71
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Faith, all,

> This likely has nothing to do with GA107 and everything to do with the
> fact that the GPU is in the dock. Also, this by itself doesn't fix a
> kernel bug. It disables DRM format modifiers in Mesa and that's likely
> having knock-on effects with compositors and GPUs vanishing. Please
> file a Mesa issue. We should sort it out in userspace.

I have reported it a week ago [1], I have also reported it previously to the
commit [2]. I'll be glad to do any testing.

Agree that the problem is not related to GA107 but the fact it's in dock. Maybe
not that many people use Thinkpad P16 with nouveau, because it was broken since
v6.10 (more than a year).

Kind regards,
Petr

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/13974
[2] https://lore.kernel.org/nouveau/20240509204352.7597-1-mohamedahmedegypt2001@gmail.com/

> ~Faith

> On Tue, Oct 7, 2025 at 11:24 AM Petr Vorel <pvorel@suse.cz> wrote:

> > 959314c438ca broke behavior at least on GA107GLM RTX A1000 on Thinkpad
> > P16, which has GPU in dock. unplugging dock freezes GUI on KDE5 Plasma,
> > plugging dock freezes GUI on GNOME.

> > As a workaround avoid setting value on NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
> > for nv177.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi all,

> > [ I'm sorry to repost due previously not being subscribed to the list ]

> > obviously this is not a solution (that's why RFC and I don't set Fixes:
> > 959314c438ca), but it documents that hardware is unusable with 959314c438ca.

> > FYI we are going to not set getparam->value for
> > NOUVEAU_GETPARAM_HAS_VMA_TILEMODE for any GPU on openSUSE Tumbleweed.
> > https://bugzilla.suse.com/show_bug.cgi?id=1198108

> > Kind regards,
> > Petr

> >  drivers/gpu/drm/nouveau/nouveau_abi16.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)

> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > index a3ba07fc48a08..fefaf7287723c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > @@ -323,7 +323,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> >                 break;
> >         }
> >         case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
> > -               getparam->value = 1;
> > +               if (drm->client.device.info.chipset != 0x177) {
> > +                       getparam->value = 1;
> > +               } else {
> > +                       NV_PRINTK(dbg, cli, "Ignoring NOUVEAU_GETPARAM_HAS_VMA_TILEMODE for 0x%x\n",
> > +                                 drm->client.device.info.chipset);
> > +               }
> >                 break;
> >         default:
> >                 NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
> > --
> > 2.51.0

