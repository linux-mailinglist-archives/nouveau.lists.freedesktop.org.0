Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47177BC59
	for <lists+nouveau@lfdr.de>; Mon, 14 Aug 2023 17:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E89810E220;
	Mon, 14 Aug 2023 15:06:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7450610E21A;
 Mon, 14 Aug 2023 15:06:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3699A1F8B8;
 Mon, 14 Aug 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692025563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfEZdmnxL2VTiZ3/PBoU2vSIytykiktCavcFmkhOmT4=;
 b=FS9Iq7RTcXhfJVDetANeBtWI9nUljyos1c9p/f7EOPLmXBVE+GRDuuypiHUlvJ3prEZWAz
 l3zoqArc8tGQMX4BiwIGfdeUV4SQAuG4is5DwoTHeeZtLqPITw5/0gzbt8bLFrpCVEdQPM
 eeQExt3yfvH8Ux2DBzfQXIaH4Y9ZTro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692025563;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfEZdmnxL2VTiZ3/PBoU2vSIytykiktCavcFmkhOmT4=;
 b=SfK+3hoWNMpKgjjM22UVNdHa4MVIThFA1tl+K7df3ztnG4D3VVHCbnITXL1fNsmJJ9CXbb
 dkw+TePVZl8r36DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB98D139BC;
 Mon, 14 Aug 2023 15:06:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gDV4M9pC2mRZDgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 15:06:02 +0000
Date: Mon, 14 Aug 2023 17:06:02 +0200
Message-ID: <87a5ut1x5x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karol Herbst <kherbst@redhat.com>
In-Reply-To: <CACO55tv4a5fHd6H-bg_W4bCP15mxAKhxCVWyR4_LqZiTsAva4Q@mail.gmail.com>
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <87fs4sfu54.wl-tiwai@suse.de>
 <CACO55tszwFEgt=8xn4auAE7KJVs3ybGG68OzL9HJt19XGVhhHQ@mail.gmail.com>
 <874jl8fngo.wl-tiwai@suse.de>
 <CACO55ts9YWF7nLi3Zs4xKySpdHyUFgf4r566cKx3FwNTCaz0Sg@mail.gmail.com>
 <87wmy4e4uk.wl-tiwai@suse.de> <877cq4e0j5.wl-tiwai@suse.de>
 <87r0occhtw.wl-tiwai@suse.de>
 <CACO55tvbLhn5vC=CpcZbuFEj2cja1=Nt=BKsZmU3+SKgbxoE7Q@mail.gmail.com>
 <87zg2t23js.wl-tiwai@suse.de>
 <CACO55tvPGx7npsXg+tpDoz=KXQBs4Pwz3h9Bie-vHithcHV5eA@mail.gmail.com>
 <CACO55tvD_t4y8s_9gj7vO7zOvsYU1iF=5+a4M2g7_qMH9g3EKg@mail.gmail.com>
 <87r0o521d2.wl-tiwai@suse.de>
 <CACO55tuvzXkUSOQh8NEwC6nEUCWYVfkUmmFWHg_miWcAUWvPsw@mail.gmail.com>
 <CACO55tv4a5fHd6H-bg_W4bCP15mxAKhxCVWyR4_LqZiTsAva4Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [Nouveau] 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO
 for HPD, not PMGR AUX interrupts")
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 regressions@leemhuis.info, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 14 Aug 2023 16:51:08 +0200,
Karol Herbst wrote:
> 
> I've sent a patch out to address this memory corruption
> https://patchwork.freedesktop.org/patch/552642/
> 
> It might or might not fix regressions from the original I2C fix, so
> please test and report if there are remaining issues.

Thanks!  I'll build a test kernel and ask the reporter for testing
with it.  Let's cross fingers :)


Takashi
