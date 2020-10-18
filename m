Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35738291895
	for <lists+nouveau@lfdr.de>; Sun, 18 Oct 2020 19:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122D36E33F;
	Sun, 18 Oct 2020 17:18:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3AE6E0F0
 for <nouveau@lists.freedesktop.org>; Sun, 18 Oct 2020 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603029898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBVMPnQfqrYuRmZ0mFLSkNqYWCaxPfshC6ZYuKW12NQ=;
 b=CE3TTm0ZWS3xUbYzjwLA7+TYTk7Dg+VxIL4Zp73oDsqTuzAXXNjBX0Doq5M5Cu6ffXkYev
 bZ3C9BpL47kMqRFuXYSmeuVfmCYD0R8cyybmNyMbwair6n3qDaCsRQ2KiiaxG8Fe9Zs8sm
 6xUrramWNvo4ZIP3aUKUh3vEKSsfIgI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-Rpf67XqbPO2njd2XyEE2PQ-1; Sun, 18 Oct 2020 10:04:56 -0400
X-MC-Unique: Rpf67XqbPO2njd2XyEE2PQ-1
Received: by mail-qv1-f71.google.com with SMTP id z9so4475996qvo.20
 for <nouveau@lists.freedesktop.org>; Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kBVMPnQfqrYuRmZ0mFLSkNqYWCaxPfshC6ZYuKW12NQ=;
 b=aVZKieOIwyIRwuuupFtV5lDhW9D7TdHBKVsRDtijBnWd5AvQ4xuZ2ykmV1knux19y+
 MeaIIB18YtXu2a8z5f0tbrWMmWptre0XsriKoqlhry2rqYX5kf6j3x5zZXDiWYaU7AGz
 xbTsFHLSU8T3MXJa9wbdzqmYptZL9isyZIUf4yJLE3/Fbfiex2dBrCKSRJRUeHO8gwbs
 uFTBEhcvJ4qSVEAYUmlexkhCBtjHw/Fj5sGYVTO775k8wBomeHLi00eK3/vEBsLyvAlS
 J6Bvr7ReVNG1P2kt30dMrCSAYNN8qpj711M274RtTvZDvjF065ySg+dEaNyXYS0uD9Oh
 ytuw==
X-Gm-Message-State: AOAM533WdZDzwEOSIGbzy2yyIGChTeBT9xT5LA2ObrJL11wY4ykfIyfT
 42dtTpfvfHNNyuyrrTUEreeb945FJPqmZwX9hNQq9aggToWZeKXpJH5FlAMIQqwCm3s+Oz/JxdS
 086EJ+wL8aNgLqjKqkx2olOpLYw==
X-Received: by 2002:a05:620a:1287:: with SMTP id
 w7mr12724296qki.436.1603029896364; 
 Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6z5rS79nBj0nCbIqVRZ9qmkAzjArqewdITB0rtwnhi1UUe/kvxLZTENMJDRITA4iBlrUAlw==
X-Received: by 2002:a05:620a:1287:: with SMTP id
 w7mr12724258qki.436.1603029896034; 
 Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id u16sm3288927qth.42.2020.10.18.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2020 07:04:55 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <eecb7c3e-88b2-ec2f-0235-280da51ae69c@redhat.com>
Date: Sun, 18 Oct 2020 07:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201018054332.GB593954@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Mailman-Approved-At: Sun, 18 Oct 2020 17:18:23 +0000
Subject: Re: [Nouveau] [RFC] treewide: cleanup unreachable breaks
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
Cc: alsa-devel@alsa-project.org, clang-built-linux@googlegroups.com,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 storagedev@microchip.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 industrypack-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
 spice-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-nfc@lists.01.org, linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, bpf@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 10/17/20 10:43 PM, Greg KH wrote:
> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> This is a upcoming change to clean up a new warning treewide.
>> I am wondering if the change could be one mega patch (see below) or
>> normal patch per file about 100 patches or somewhere half way by collecting
>> early acks.
> Please break it up into one-patch-per-subsystem, like normal, and get it
> merged that way.

OK.

Thanks,

Tom

>
> Sending us a patch, without even a diffstat to review, isn't going to
> get you very far...
>
> thanks,
>
> greg k-h
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
