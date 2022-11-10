Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328776F6B58
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89D810E3EC;
	Thu,  4 May 2023 12:31:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B5D10E876
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 15:22:36 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ud5so5855038ejc.4
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d0D2mWc0p6TOs3yjnJ78ySw3xrOX6SYV20k47DqtpQ=;
 b=ga8FBPk/nBNCLcym6IQmq98rrk8UiX4wPBkn9SRRAU5cn2mGbb857uy0FsS0PDrjHx
 sJ8GzUWjEiGg7VTyZ0qia7luiAALC/1CF8z9wq51uX8IoRwUQZ+SJgTrbF57CZcaxOrN
 KB5jchRZglqjNkFbRCDtDILt+8fy80UGUOAsb61nMwCKRP8pyHnDu1crTAGaRS5NeJ1P
 wyZgZJ6Qg2rtKLXu55peSYCaJHp2LLPhVKIRx/6lFNDgRFj0PY397mgrGV/0L9qKc8kg
 O+Xn4QGk6EXX40QKopTSLd9RikxLJ6vyrEJqMeQ4xILgrHqVZNGyyUO04cxFWR1lCv1a
 8AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6d0D2mWc0p6TOs3yjnJ78ySw3xrOX6SYV20k47DqtpQ=;
 b=FNG1VDjyVGwP+CS72vtprZn7biBNYbB+vdVLxk/15DnR3eJjh7fVTk50XUAWdv4xAK
 gPnchZtoiGrv8NM/7mSMIOXkjvZcr9AHyn/TNpwnI1z3TT4+VW7uz0OtnPvmdzxg+DXt
 aF634qNMPf+r7zj7wjGK6DV8FguNVaddz/wUQrAzCmBDKHj+e8UMPSQNApRpxoj8IXpc
 +XS4z15cclirhsEhZm4Bpyt6LNPvBibom4au8+RMYNo1reoiXg0/9YC0cb6Wd4uWYx/n
 x9PRMlR8wci6sGWVu79AChjCpU+6bV9IWN6DBneFv6J4vS7q1NzUU1HTs7R7bdJwzxFt
 0Vbg==
X-Gm-Message-State: ACrzQf1vn9QY2duV7aw+atbesVGLfUNISpUA7TrJxBqTdN4SBlfBpDd+
 g6dw4z/8LdEFbI5S1w9viA==
X-Google-Smtp-Source: AMsMyM5s9iuAWKwm9s/X5huTIhKPbpaV39w/jTupO0Mw8BuVF5jEUYeJUj5j4KGsoiCDI+FJ04/duA==
X-Received: by 2002:a17:906:a190:b0:7ad:dc7e:1b8d with SMTP id
 s16-20020a170906a19000b007addc7e1b8dmr2940759ejy.276.1668093754606; 
 Thu, 10 Nov 2022 07:22:34 -0800 (PST)
Received: from ?IPV6:2a02:2f01:740e:c00::2110? ([2a02:2f01:740e:c00::2110])
 by smtp.gmail.com with ESMTPSA id
 et19-20020a170907295300b0078df26efb7dsm7252772ejc.107.2022.11.10.07.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 07:22:33 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ns0XG0mYt3tdyEtA3330u94W"
Message-ID: <ba834410-641c-0219-711b-aa6136a8fd55@gmail.com>
Date: Thu, 10 Nov 2022 17:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Ajay Gupta <ajayg@nvidia.com>, Karol Herbst <kherbst@redhat.com>
References: <tk6dm1$jsm$1@ciao.gmane.io>
 <CACO55tt5QTM=Amm560pBoDyKdib+YL77-d3rArhi0AmtLOdPMg@mail.gmail.com>
 <DM4PR12MB57708357FD79CF2D7FF02298DC3E9@DM4PR12MB5770.namprd12.prod.outlook.com>
From: Timothy Madden <terminatorul@gmail.com>
In-Reply-To: <DM4PR12MB57708357FD79CF2D7FF02298DC3E9@DM4PR12MB5770.namprd12.prod.outlook.com>
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:33 +0000
Subject: Re: [Nouveau] Fans ramping up randomly when idle
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------ns0XG0mYt3tdyEtA3330u94W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/22 00:50, Ajay Gupta wrote:
>
>>> This issue happens even when the card is not connected to a monitor.
>>>
>>> My dmesg output from nouveau is included below, I think the last 2
>>> lines are the relevant ones:
>>> [ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state
>>> from D3hot to D0, device inaccessible [ 9427.889387] nvidia-gpu
>>> 0000:0b:00.3: i2c timeout error ffffffff
> This only implies that there is no usb/ucsi device on the card, it is expected from
> such cards and should be seen in dmesg even when heating issue is not there.
>
> Thanks

The 2080 Ti graphics card has an USB-C output, that works if I connect 
an USB storage device
(see the DataTraveler device below).

Should I try the USB port as a video output ? I need to bring in an 
USB-C monitor first
from a different location. I also have an USB-C to HDMI adapter, but 
using such an
adapter gives a different crash with nouveau driver, that I found on a 
different machine
(my work laptop at the time), that I reported before. So I suppose it 
would not be a
good test now.


localhost:/home/timothy #lsusb
Bus 008 Device 002: ID 05e3:0616 Genesys Logic, Inc. hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 002: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 002: ID 0951:176c Kingston Technology DataTraveler Max
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 11b0:5111 ATECH FLASH TECHNOLOGY PRO88 Reader
Bus 002 Device 002: ID 11b0:0031 ATECH FLASH TECHNOLOGY USB3.1 Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 006: ID 09da:2268 A4Tech Co., Ltd. USB Keyboard
Bus 001 Device 004: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 003: ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth 
Adapter
Bus 001 Device 005: ID 046d:c24a Logitech, Inc. G600 Gaming Mouse
Bus 001 Device 002: ID 11b0:0021 ATECH FLASH TECHNOLOGY USB2.0 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
localhost:/home/timothy #lsusb --tree
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/2p, 5000M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
    |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=uas, 10000M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/8p, 10000M
    |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 
5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/14p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
    |__ Port 2: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
    |__ Port 2: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
    |__ Port 9: Dev 4, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 3: Dev 6, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
        |__ Port 3: Dev 6, If 1, Class=Human Interface Device, 
Driver=usbhid, 1.5M
    |__ Port 10: Dev 5, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
    |__ Port 10: Dev 5, If 1, Class=Human Interface Device, 
Driver=usbhid, 12M
localhost:/home/timothy #


--------------ns0XG0mYt3tdyEtA3330u94W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/22 00:50, Ajay Gupta wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM4PR12MB57708357FD79CF2D7FF02298DC3E9@DM4PR12MB5770.namprd12.prod.outlook.com"><br>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This issue happens even when the card is not connected to a monitor.

My dmesg output from nouveau is included below, I think the last 2
lines are the relevant ones:
[ 9426.768449] nvidia-gpu 0000:0b:00.3: Unable to change power state
from D3hot to D0, device inaccessible [ 9427.889387] nvidia-gpu
0000:0b:00.3: i2c timeout error ffffffff
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This only implies that there is no usb/ucsi device on the card, it is expected from
such cards and should be seen in dmesg even when heating issue is not there.

Thanks
</pre>
    </blockquote>
    <p>The 2080 Ti graphics card has an USB-C output, that works if I
      connect an USB storage device<br>
      (see the DataTraveler device below).</p>
    <p>Should I try the USB port as a video output ? I need to bring in
      an USB-C monitor first<br>
      from a different location. I also have an USB-C to HDMI adapter,
      but using such an<br>
      adapter gives a different crash with nouveau driver, that I found
      on a different machine<br>
      (my work laptop at the time), that I reported before. So I suppose
      it would not be a<br>
      good test now.</p>
    <p><br>
    </p>
    <p><span style="font-family:monospace"><span
          style="font-weight:bold;color:#ff5454;background-color:#ffffff;"><a class="moz-txt-link-freetext" href="localhost:/home/timothy">localhost:/home/timothy</a>
          #</span><span style="color:#000000;background-color:#ffffff;">
          lsusb
        </span><br>
        Bus 008 Device 002: ID 05e3:0616 Genesys Logic, Inc. hub
        <br>
        Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        <br>
        Bus 007 Device 002: ID 05e3:0610 Genesys Logic, Inc. Hub
        <br>
        Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
        <br>
        Bus 006 Device 002: ID 0951:176c Kingston Technology
        DataTraveler Max
        <br>
        Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        <br>
        Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
        <br>
        Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        <br>
        Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
        <br>
        Bus 002 Device 003: ID 11b0:5111 ATECH FLASH TECHNOLOGY PRO88
        Reader
        <br>
        Bus 002 Device 002: ID 11b0:0031 ATECH FLASH TECHNOLOGY USB3.1
        Hub
        <br>
        Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        <br>
        Bus 001 Device 006: ID 09da:2268 A4Tech Co., Ltd. USB Keyboard
        <br>
        Bus 001 Device 004: ID 1a40:0101 Terminus Technology Inc. Hub
        <br>
        Bus 001 Device 003: ID 8087:0025 Intel Corp. Wireless-AC 9260
        Bluetooth Adapter
        <br>
        Bus 001 Device 005: ID 046d:c24a Logitech, Inc. G600 Gaming
        Mouse
        <br>
        Bus 001 Device 002: ID 11b0:0021 ATECH FLASH TECHNOLOGY USB2.0
        Hub
        <br>
        Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
        <br>
        <span
          style="font-weight:bold;color:#ff5454;background-color:#ffffff;"><a class="moz-txt-link-freetext" href="localhost:/home/timothy">localhost:/home/timothy</a>
          #</span><span style="color:#000000;background-color:#ffffff;">
          lsusb --tree
        </span><br>
        /:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p,
        5000M
        <br>
           |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/2p, 5000M
        <br>
        /:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p,
        480M
        <br>
           |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
        <br>
        /:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p,
        10000M
        <br>
           |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=uas,
        10000M
        <br>
        /:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p,
        480M
        <br>
        /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p,
        10000M
        <br>
        /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p,
        480M
        <br>
        /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/8p,
        10000M
        <br>
           |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        <br>
               |__ Port 1: Dev 3, If 0, Class=Mass Storage,
        Driver=usb-storage, 5000M
        <br>
        /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/14p,
        480M
        <br>
           |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        <br>
           |__ Port 2: Dev 3, If 0, Class=Wireless, Driver=btusb, 12M
        <br>
           |__ Port 2: Dev 3, If 1, Class=Wireless, Driver=btusb, 12M
        <br>
           |__ Port 9: Dev 4, If 0, Class=Hub, Driver=hub/4p, 480M
        <br>
               |__ Port 3: Dev 6, If 0, Class=Human Interface Device,
        Driver=usbhid, 1.5M
        <br>
               |__ Port 3: Dev 6, If 1, Class=Human Interface Device,
        Driver=usbhid, 1.5M
        <br>
           |__ Port 10: Dev 5, If 0, Class=Human Interface Device,
        Driver=usbhid, 12M
        <br>
           |__ Port 10: Dev 5, If 1, Class=Human Interface Device,
        Driver=usbhid, 12M
        <br>
        <span
          style="font-weight:bold;color:#ff5454;background-color:#ffffff;"><a class="moz-txt-link-freetext" href="localhost:/home/timothy">localhost:/home/timothy</a>
          #</span><span style="color:#000000;background-color:#ffffff;">
        </span><br>
        <br>
        <br>
      </span></p>
  </body>
</html>

--------------ns0XG0mYt3tdyEtA3330u94W--
