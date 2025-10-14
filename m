Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C15BDA8F4
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 18:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0C10E650;
	Tue, 14 Oct 2025 16:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="VBgQzW6S";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qoYFgiAE";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VBgQzW6S";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qoYFgiAE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170910E650
 for <nouveau@lists.freedesktop.org>; Tue, 14 Oct 2025 16:07:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59F4121D15;
 Tue, 14 Oct 2025 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760458034;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kbDGaXLXVD46KXPLWkyq4S3wGdNS6gkPWVffl+CsZoM=;
 b=VBgQzW6Sih+mn+mHPApUHMOmJJDLTwzvwaGxAYlJe0V6LObau5zcqrWHnRTbGDOrlYzWVk
 cvcg0xIdFYXIh6xhdRwHNfpdg1i+AmoJsAqYiJ/NSUOBlalCC+pZ9Hj5RTFJ/YIgrNMR0m
 p5Hgsup3fHTZ4aCW9Vno2n3Qk7aL8W8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760458034;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kbDGaXLXVD46KXPLWkyq4S3wGdNS6gkPWVffl+CsZoM=;
 b=qoYFgiAEEOp0ULEKCrKwVrFh5WMb2XS0T9nbG5IiFcDQGXr0y7+uG6SZ+1O4rcZ2JIumDv
 DD3c/QRzGLG8QBAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1760458034;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kbDGaXLXVD46KXPLWkyq4S3wGdNS6gkPWVffl+CsZoM=;
 b=VBgQzW6Sih+mn+mHPApUHMOmJJDLTwzvwaGxAYlJe0V6LObau5zcqrWHnRTbGDOrlYzWVk
 cvcg0xIdFYXIh6xhdRwHNfpdg1i+AmoJsAqYiJ/NSUOBlalCC+pZ9Hj5RTFJ/YIgrNMR0m
 p5Hgsup3fHTZ4aCW9Vno2n3Qk7aL8W8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1760458034;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kbDGaXLXVD46KXPLWkyq4S3wGdNS6gkPWVffl+CsZoM=;
 b=qoYFgiAEEOp0ULEKCrKwVrFh5WMb2XS0T9nbG5IiFcDQGXr0y7+uG6SZ+1O4rcZ2JIumDv
 DD3c/QRzGLG8QBAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D007139B0;
 Tue, 14 Oct 2025 16:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +Ed5CTJ17mgvXQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 14 Oct 2025 16:07:14 +0000
Date: Tue, 14 Oct 2025 18:07:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alex =?iso-8859-2?Q?Ram=EDrez?= <lxrmrz732@rocketmail.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/nouveau: add missing DCB connector types
Message-ID: <20251014160712.GC181869@pevik>
References: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
 <20251013222424.12613-5-lxrmrz732@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013222424.12613-5-lxrmrz732@rocketmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[rocketmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[rocketmail.com]; RCPT_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:url,suse.cz:email,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.50
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

Hi Alex,

> * Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

> A lot of connector logic was rewritten for Linux v6.5; some display connector types
> went unaccounted-for which caused kernel warnings on devices with the now-unsupported
> DCB connectors. This patch adds all of the DCB connectors as defined by NVIDIA to the
> dcb_connector_type enum to bring back support for these connectors to the new logic.

> Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
> Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
nit: maybe
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry

Thanks for adding the docs as comments!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
