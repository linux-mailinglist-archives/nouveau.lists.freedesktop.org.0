Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0795EA0A
	for <lists+nouveau@lfdr.de>; Mon, 26 Aug 2024 09:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04F310E11B;
	Mon, 26 Aug 2024 07:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yiRsuF6J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="29qQqnFg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yiRsuF6J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="29qQqnFg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1DE10E117;
 Mon, 26 Aug 2024 07:11:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78B091F843;
 Mon, 26 Aug 2024 07:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724656312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SPGZhv40/HCD6CrWni/Ro0VawjhkfbRkAq/pKepOG04=;
 b=yiRsuF6JiAtqiOk9gt3PEf2krtfxOQ2u51mW+KGmD+x5s2UFbWxfxyQqJsBihiahItJc/K
 0kaccrjqshrHp7NYLFAG91Ro93OaSUVUsG9gLEcL1qyXyBN3+dX9KIcKyw71ZuPk12lefk
 fjbAFZPUgKVjR4CtmDPnHBYNmHJL9s0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724656312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SPGZhv40/HCD6CrWni/Ro0VawjhkfbRkAq/pKepOG04=;
 b=29qQqnFgDsGd5nkxZ8fQOVtYsaiRcfxdUNwefj13wi4tM7UYuenFuavriwgfSbn/L8ecQy
 gZexfuis3UJGJZCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yiRsuF6J;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=29qQqnFg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724656312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SPGZhv40/HCD6CrWni/Ro0VawjhkfbRkAq/pKepOG04=;
 b=yiRsuF6JiAtqiOk9gt3PEf2krtfxOQ2u51mW+KGmD+x5s2UFbWxfxyQqJsBihiahItJc/K
 0kaccrjqshrHp7NYLFAG91Ro93OaSUVUsG9gLEcL1qyXyBN3+dX9KIcKyw71ZuPk12lefk
 fjbAFZPUgKVjR4CtmDPnHBYNmHJL9s0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724656312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SPGZhv40/HCD6CrWni/Ro0VawjhkfbRkAq/pKepOG04=;
 b=29qQqnFgDsGd5nkxZ8fQOVtYsaiRcfxdUNwefj13wi4tM7UYuenFuavriwgfSbn/L8ecQy
 gZexfuis3UJGJZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F6FF1398D;
 Mon, 26 Aug 2024 07:11:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /zNuBrgqzGb1QgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Aug 2024 07:11:52 +0000
Message-ID: <65faaa8b-72b5-4fa3-9959-8fecba90ad30@suse.de>
Date: Mon, 26 Aug 2024 09:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/86] drm/atmel-hdlcd: Run DRM default client setup
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-12-tzimmermann@suse.de>
 <20240823185156.GA367392@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240823185156.GA367392@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 78B091F843
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[14]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,lists.freedesktop.org,kernel.org,microchip.com,bootlin.com,tuxon.dev];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email, suse.de:dkim, suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.51
X-Spam-Flag: NO
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

Hi Sam

Am 23.08.24 um 20:51 schrieb Sam Ravnborg:
> On Wed, Aug 21, 2024 at 02:59:08PM +0200, Thomas Zimmermann wrote:
>> Call drm_client_setup_with_fourcc() to run the kernel's default client
>> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
>> setup can start the common fbdev client.
>>
>> v2:
>> - use drm_client_setup_with_fourcc()
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Hi Thomas.
>
>> ---
>>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> index 9ce429f889ca..ca5bde8ac300 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
>> @@ -18,8 +18,10 @@
>>   
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_client_setup.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_dma.h>
>> +#include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_module.h>
>> @@ -865,7 +867,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_unload;
>>   
>> -	drm_fbdev_dma_setup(ddev, 24);
>> +	drm_client_setup_with_fourcc(ddev, DRM_FORMAT_RGB888);
>>   
>>   	return 0;
> I looks like a patch is missing to add DRM_FBDEV_DMA_DRIVER_OPS to
> struct drm_driver?

Indeed. Thanks a lot for proof reading. I'll double-check the other 
patches for the next iteration.

Best regards
Thomas

>
> 	Sam

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

