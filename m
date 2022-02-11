Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF44B219F
	for <lists+nouveau@lfdr.de>; Fri, 11 Feb 2022 10:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50F10EA51;
	Fri, 11 Feb 2022 09:22:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604D810EA52
 for <nouveau@lists.freedesktop.org>; Fri, 11 Feb 2022 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644571343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JATPSfuuIzbUvjucn3mqiTWieLFcGsiKYRvySMK0CuY=;
 b=MJpWt3UCHCojLJ61Oy4FxeI3nWm2lR3SDqgRdLOZuLP2DU9xFQI6WuMHrwvhQ2fhJ3OGKx
 f80iuS1QZtfj7+w5ilVOmkPpP9rInhpVe4lD/vStp1kb+XVqk0GGFOK+OLWhTinSSnJdhc
 HmJUy8TUSrR/YWk+dUb5GwCAG67Xw+U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-KhB_whLJPbq4N4xjp4domg-1; Fri, 11 Feb 2022 04:22:22 -0500
X-MC-Unique: KhB_whLJPbq4N4xjp4domg-1
Received: by mail-ej1-f70.google.com with SMTP id
 z26-20020a1709067e5a00b006cbe0628826so3841597ejr.10
 for <nouveau@lists.freedesktop.org>; Fri, 11 Feb 2022 01:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JATPSfuuIzbUvjucn3mqiTWieLFcGsiKYRvySMK0CuY=;
 b=L0kiVwD6D3ELWf7gS24DNFn5jDESPq1NTVHPfhGSFdxBgCg2FNamaIrdd2hEmfm9jM
 lVkXtvxdCFSyrhzjvc1GaFBllQ8/QD41sdMrJdVzXAMfDbFWuu8zdRYgtDop2W3rvCrW
 11vbG8s175ZtejYdezLDDgoeAIM+1YjTBqhrttlWu1K4oa6F2Dlj1RCs1kzlNBjYYW6R
 DIcmonnlxt7xPH8L8DfERD4g+wdxdqYNpFg7/fv/I5B3CjWOJXrvNsf7w7dgAa9sP2LC
 tVDrU113dQjnJ6W/M/YaBOHCul+Y1Y14OSGooFpjXylNhmZOqn4Uv6VwJb7lF5PjzJHU
 vTjA==
X-Gm-Message-State: AOAM533SB4ixpb63ufHQjDpvV7508qRGl3dQ7gJP8Ox8uCrkdJrO/ND/
 NdpwTG6jGP8FfirNU7zu0EjkC2P5fd5tEmbsxL9W96YCQSoTFC+/Om8OUUCatZj0kDsCpE4VHtc
 7Xly3jU6uVKxEu/hpd4aH1J9R3g==
X-Received: by 2002:a17:906:9741:: with SMTP id
 o1mr634470ejy.452.1644571341123; 
 Fri, 11 Feb 2022 01:22:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJzLEHrlpWTVVnLCXx+X1wR5IUJlkBcCT7V/xFq7SwXUygMIWI6NCaHgu9RUznaxy1V50DlQ==
X-Received: by 2002:a17:906:9741:: with SMTP id
 o1mr634448ejy.452.1644571340909; 
 Fri, 11 Feb 2022 01:22:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id y22sm3647503ejm.225.2022.02.11.01.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:22:20 -0800 (PST)
Message-ID: <aa1f140d-0f1b-852c-da8b-75e437537ef2@redhat.com>
Date: Fri, 11 Feb 2022 10:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Yehezkel Bernat <yehezkelshb@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
 <20220210224329.2793-9-mario.limonciello@amd.com>
 <CA+CmpXtah8AeVehExk0+eagyP=DQOPEy18DW3t2rQ0ZjyMk-Rw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CA+CmpXtah8AeVehExk0+eagyP=DQOPEy18DW3t2rQ0ZjyMk-Rw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 8/9] platform/x86: amd-gmux: drop the use
 of `pci_is_thunderbolt_attached`
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 2/11/22 10:00, Yehezkel Bernat wrote:
> On Fri, Feb 11, 2022 at 12:43 AM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> Currently `pci_is_thunderbolt_attached` is used to indicate a device
>> is connected externally.
>>
>> The PCI core now marks such devices as removable and downstream drivers
>> can use this instead.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>  drivers/platform/x86/apple-gmux.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
>> index 04232fbc7d56..ffac15b9befd 100644
>> --- a/drivers/platform/x86/apple-gmux.c
>> +++ b/drivers/platform/x86/apple-gmux.c
>> @@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
>>
>>  static int is_thunderbolt(struct device *dev, void *data)
>>  {
>> -       return pci_is_thunderbolt_attached(to_pci_dev(dev));
>> +       return dev_is_removable(dev);
>>  }
>>
> 
> Maybe it's only me, but isn't it a bit strange to keep this function named
> `is_thunderbolt` while it's actually about being removable?

The comment above the only caller says:

        /*
         * If Thunderbolt is present, the external DP port is not fully
         * switchable. Force its AUX channel to the discrete GPU.
         */
        gmux_data->external_switchable =
                !bus_for_each_dev(&pci_bus_type, NULL, NULL, is_thunderbolt);

So IHMO keeping the name as is is fine.

Regards,

Hans

