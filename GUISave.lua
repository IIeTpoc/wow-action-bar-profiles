local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local frame = PaperDollActionBarProfilesSaveDialog

function frame:OnInitialize()
	StaticPopupDialogs.CONFIRM_OVERWRITE_ACTION_BAR_PROFILE = {
		text = L.confirm_overwrite,
		button1 = YES,
		button2 = NO,
		OnAccept = function(popup) self:OnOverwriteConfirm(popup) end,
		OnCancel = function(popup) end,
		OnHide = function(popup) end,
		hideOnEscape = 1,
		timeout = 0,
		exclusive = 1,
		whileDead = 1,
	}

	self.SaveDialogTitleText:SetText(L.save_dialog_title)
	self.ProfileOptionsText:SetText(L.profile_options)

	_G[self.SkipEmptySlots:GetName() .. "Text"]:SetText(" " .. L.skip_empty_slots)
	_G[self.SkipSpells:GetName()     .. "Text"]:SetText(" " .. L.skip_spells)
	_G[self.SkipItems:GetName()      .. "Text"]:SetText(" " .. L.skip_items)
	_G[self.SkipCompanions:GetName() .. "Text"]:SetText(" " .. L.skip_companions)
	_G[self.SkipMacros:GetName()     .. "Text"]:SetText(" " .. L.skip_macros)
	_G[self.SkipEquipSets:GetName()  .. "Text"]:SetText(" " .. L.skip_equipsets)
	_G[self.SkipPetSpells:GetName()  .. "Text"]:SetText(" " .. L.skip_pet_spells)
end

function frame:OnOkayClick()
	local name = self.EditBox:GetText()

	if self.name then
		if name ~= self.name then
			if addon:GetProfile(name) then
				UIErrorsFrame:AddMessage(L.error_exists, 1.0, 0.1, 0.1, 1.0)
				return
			end
		end
		addon:UpdateProfileParams(self.name, name)
	else
		if addon:GetProfile(name) then
			local popup = StaticPopup_Show("CONFIRM_OVERWRITE_ACTION_BAR_PROFILE", name)
			if popup then
				popup.name = name
			else
				UIErrorsFrame:AddMessage(ERR_CLIENT_LOCKED_OUT, 1.0, 0.1, 0.1, 1.0)
			end
			return
		end
		addon:SaveProfile(name)
	end

	PaperDollActionBarProfilesPane:Update()
	self:Hide()
end

function frame:OnOverwriteConfirm(popup)
	addon:SaveProfile(popup.name)

	PaperDollActionBarProfilesPane:Update()
	self:Hide()
end

function frame:OnCancelClick()
	self:Hide()
end

function frame:Update()
	if self.EditBox:GetText() ~= "" then
		self.Okay:Enable()
	else
		self.Okay:Disable()
	end
end

function frame:SetProfile(name)
	self.name = nil
	self.EditBox:SetText("")

	if name then
		self.name = name

		self.EditBox:SetText(self.name)
		self.EditBox:HighlightText(0)
	end

	self:Update()
end
